<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CheckColumnsThroughMigrations extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:check-columns-through-migrations';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check if columns are created through migrations';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $tables = DB::select('SHOW TABLES');
        $tableList = array_map('current', $tables);

        $migrationColumns = $this->getMigrationColumns();
        $dumpColumns = $this->getDumpColumns();

        foreach ($tableList as $table) {
            $columns = Schema::getColumnListing($table);
            $this->checkColumns($table, $columns, $migrationColumns, $dumpColumns);
        }

        return Command::SUCCESS;
    }

    protected function getMigrationColumns()
    {
        $migrationFiles = glob(database_path('migrations/*.php'));
        $migrationColumns = [];

        foreach ($migrationFiles as $file) {
            $content = file_get_contents($file);
            preg_match_all('/\$table->.*?\(\'(.*?)\'\)/', $content, $matches);

            if (isset($matches[1])) {
                foreach ($matches[1] as $column) {
                    $migrationColumns[] = $column;
                }
            }
        }

        return $migrationColumns;
    }

    protected function getDumpColumns()
    {
        $dumpFile = database_path('schema/mysql-schema.dump');
        $dumpColumns = [];

        if (file_exists($dumpFile)) {
            $content = file_get_contents($dumpFile);
            preg_match_all('/`(.*?)` .*?,/', $content, $matches);

            if (isset($matches[1])) {
                $dumpColumns = $matches[1];
            }
        }

        return $dumpColumns;
    }

    protected function checkColumns($table, $columns, $migrationColumns, $dumpColumns)
    {
        foreach ($columns as $column) {
            if (! in_array($column, $migrationColumns) && ! in_array($column, $dumpColumns)) {
                $this->warn("Column '$column' in table '$table' was not created through migrations or dump file.");
            }
        }
    }
}
