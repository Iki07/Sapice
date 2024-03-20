<?php
class Log {
    public static function writeIntoLog ($file, $text) {
        $old_text="";
        if (file_exists($file)) $old_text=file_get_contents($file);
        $new_text=date("d.m.Y H:i:s")." - {$text}\n";
        file_put_contents($file, $new_text.$old_text);
    }
}
?>