import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileHelper {
  static Future<List<String>?> pickTextLines() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final lines = await file.readAsLines();
      return lines.map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    }

    return null;
  }
}
