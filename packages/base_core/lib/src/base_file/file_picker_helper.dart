import 'dart:io';
import 'package:base_core/src/base_extension.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';
import 'package:base_core/src/base_file/file_entity.dart';

class FilePickerHelper {
  static Future<FileEntity> selectSingleFile({
    Function(FilePickerStatus status)? onFileLoading,
    FileType? fileType,
  }) async {
    late File file;
    final result = await FilePicker.platform.pickFiles(
      onFileLoading: onFileLoading,
      type: fileType ?? FileType.any,
    );
    if (result != null) {
      file = File(result.files.single.path.toString());
      return _mapFileToModel(file);
    }
    return FileEntity();
  }

  static Future<List<FileEntity>> selectMultipleFile({
    Function(FilePickerStatus status)? onFileLoading,
    FileType? fileType,
  }) async {
    final files = <FileEntity>[];
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withReadStream: true,
      onFileLoading: onFileLoading,
      type: fileType ?? FileType.any,
    );
    if (result != null) {
      for (final f in result.files) {
        final file = File(f.path.toString());
        final fileEntity = await _mapFileToModel(file);
        files.add(fileEntity);
      }
    } else {}
    return files;
  }

  static Future<FileEntity> _mapFileToModel(File file) async {
    final FileEntity entity = FileEntity();
    entity
      ..url = file.path
      ..fileSize = file.size
      ..fileName = file.name
      ..mimeType = lookupMimeType(file.path)
      ..file = file;
    final bytes = await file.readAsBytes();

    // final bs4str = base64.encode(bytes);
    entity.binary = bytes;
    return entity;
  }

  static Future<String> fileToBinary(File file) async {
    List<int> fileBytes = await file.readAsBytes();
    final binaryData = fileBytes.map((byte) => byte.toRadixString(2).padLeft(8, '0')).join('');
    return binaryData;
  }
}
