<?php

namespace App\Http\Controllers;

use App\Models\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PdfController extends Controller
{
    public function uploadPdf(Request $request)
    {
        $request->validate([
            'pdf' => 'required|file|mimes:pdf|max:2048',
        ]);

        $file = $request->file('pdf');
        $fileName = Str::random(10) . '.' . $file->getClientOriginalExtension();
        $filePath = $file->storeAs('pdfs', $fileName, 'public');

        Pdf::updateOrCreate(
            ['id' => 1],  // Using a static ID for simplicity, adjust as needed
            ['file_path' => $filePath]
        );

        return response()->json(['message' => 'PDF uploaded successfully!']);
    }

    public function downloadPdf()
    {
        $pdf = Pdf::find(1);  // Adjust as needed
    
        if ($pdf) {
            $filePath = $pdf->file_path;  // Path stored in database
    
            if (Storage::disk('public')->exists($filePath)) {
                return Storage::disk('public')->download($filePath);
            } else {
                return response()->json(['message' => 'File not found in storage.'], 404);
            }
        }
    
        return response()->json(['message' => 'No PDF record found.'], 404);
    }
    

}
