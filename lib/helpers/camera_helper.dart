import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraHelper {
  static final _picker = ImagePicker();

  static Future<File> pickImage(
      {ImageSource source: ImageSource.camera}) async {
    try {
      var pickedFile = await _picker.getImage(source: source);

      if (pickedFile == null) return null;

      return File(pickedFile.path);
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
