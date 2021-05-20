import 'dart:io';

class FileHelper {
  static Future<File> saveFile(File file) async {
    return file.writeAsBytes(await file.readAsBytes());
  }
}
