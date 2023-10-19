<?php

namespace App\Http\Controllers;

use App\Models\Repositorio;
use App\Models\RepositorioArchivo;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RepositorioArchivoController extends Controller
{
    public function store(Repositorio $repositorio, Request $request)
    {
        DB::beginTransaction();
        try {
            $file = $request->file("file");

            $extension = $file->getClientOriginalExtension();
            $tipo = self::getTipoArchivo($extension);

            // Validar el peso en KB
            $fileSizeKB = $file->getSize() / 1024; // Convertir a KB

            // Comprueba si el tamaño es mayor que 4096 KB (4 MB)
            if ($fileSizeKB > 4096) {
                throw new Exception("El archivo supera el tamaño permitido de 4096 KB", 400);
            }

            // validar tipo
            if ($tipo == 'otro') {
                throw new Exception("No es posible subir el archivo que seleccionaste", 400);
            }

            $nombre_original = $file->getClientOriginalName();
            $nombre_archivo = time() . str_replace(" ", "_", $nombre_original);

            $file->move(public_path() . "/files/", $nombre_archivo);

            $nuevo_archivo = RepositorioArchivo::create([
                "repositorio_id" => $repositorio->id,
                "archivo" => $nombre_archivo,
                "ext" => $extension,
                "tipo" => $tipo,
            ]);

            DB::commit();
            return response()->JSON([
                "sw" => true,
                "archivo" => $nuevo_archivo
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                "sw" => false,
                "message" => $e->getMessage()
            ], 500);
        }
    }

    public function destroy(RepositorioArchivo $repositorio_archivo)
    {
        DB::beginTransaction();
        try {
            $archivo = $repositorio_archivo->archivo;
            \File::delete(public_path("files/" . $archivo));
            $repositorio_archivo->delete();
            DB::commit();
            return response()->JSON([
                "sw" => true,
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                "sw" => false,
                "message" => $e->getMessage()
            ], 500);
        }
    }

    public static function getTipoArchivo($extension)
    {
        $audio = ["mp3", "wav", "ogg"];
        $video = ["mp4", "avi", "mkv"];
        $imagen = ["jpg", "jpeg", "png", "webp", "gif"];
        $archivo = ["docx", "doc", "pdf", "xls", "xlsx", "csv", "rar", "zip"];

        if (in_array($extension, $audio)) {
            return "audio";
        }
        if (in_array($extension, $video)) {
            return "video";
        }
        if (in_array($extension, $imagen)) {
            return "imagen";
        }
        if (in_array($extension, $archivo)) {
            return "archivo";
        }
        return "otro";
    }
}
