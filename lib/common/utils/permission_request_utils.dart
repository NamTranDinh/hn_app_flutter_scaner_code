import 'package:flutter/cupertino.dart';
import 'package:master_scanner_app/common/widgets/dialog_request_permission.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequestUtil {
  static Future<PermissionStatus> checkCameraPermission(BuildContext context) async =>
      Permission.camera.status.then((value) async {
        if (value.isDenied) {
          await Permission.camera.request().then((v) => value = v);
        } else if (value.isPermanentlyDenied) {
          await openDialogRequestPermission(context);
        }
        return value;
      });
}
