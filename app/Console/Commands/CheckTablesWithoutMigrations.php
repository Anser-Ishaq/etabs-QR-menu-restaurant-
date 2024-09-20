<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class CheckTablesWithoutMigrations extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:check-tables-without-migrations';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check for tables without migration files';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $allTables = DB::select('SHOW TABLES');
        $tableList = array_map('current', $allTables);

        $migrationTables = $this->getMigrationTables();
        $dumpTables = $this->getDumpTables();

        $allMigrationAndDumpTables = array_unique(array_merge($migrationTables, $dumpTables));

        $tablesWithoutMigrations = array_diff($tableList, $allMigrationAndDumpTables);

        if (empty($tablesWithoutMigrations)) {
            $this->info('All tables have corresponding migration or dump file entries.');
        } else {
            $this->warn('Tables without migration files:');
            foreach ($tablesWithoutMigrations as $table) {
                $this->line($table);
            }
        }

        return Command::SUCCESS;
    }

    protected function getMigrationTables()
    {
        $migrationFiles = glob(database_path('migrations/*.php'));
        $migrationTables = [];

        foreach ($migrationFiles as $file) {
            $content = file_get_contents($file);
            preg_match('/Schema::create\(\'(.*?)\',/', $content, $matches);

            if (isset($matches[1])) {
                $migrationTables[] = $matches[1];
            }
        }

        return $migrationTables;
    }

    protected function getDumpTables()
    {
        $dumpFile = database_path('schema/mysql-schema.dump');
        $dumpTables = [];

        if (file_exists($dumpFile)) {
            $content = file_get_contents($dumpFile);
            preg_match_all('/CREATE TABLE `(.*?)`/', $content, $matches);

            if (isset($matches[1])) {
                $dumpTables = $matches[1];
            }
        }

        return $dumpTables;
    }
}
