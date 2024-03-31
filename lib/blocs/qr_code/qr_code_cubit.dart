import 'package:base_core/base_core.dart' as base_core;
import 'package:base_core/base_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:master_scanner_app/common/utils/permission_request_utils.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:permission_handler/permission_handler.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit() : super(QrCodeState.init());

  Future<void> openCamera(BuildContext context) async {
    emit(state.copyWith(status: base_core.Status.loading));
    await PermissionRequestUtil.checkCameraPermission(context).then((value) {
      if (value.isGranted || value.isLimited || value.isProvisional || value.isRestricted) {
        emit(state.copyWith(status: base_core.Status.success));
      } else {
        emit(state.copyWith(status: base_core.Status.failure));
      }
    });
  }

  void scan({QrCodeResultModel? data}) {
    emit(state.copyWith(status: base_core.Status.loading));
    if (data?.data != null && (data?.data?.isNotEmpty ?? false)) {
      data?.createDate = base_core.DateUtils.formatDateTimeToString();
      emit(state.copyWith(status: base_core.Status.success, data: data));
    }
  }

  void changeStatusState(Status status){
    emit(state.copyWith(status: status));
  }

  Future<void> onDownloadQrImage(Uint8List? bytes) async {
    final status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    } else {
      try {
        if (bytes == null) return;
        emit(state.copyWith(status: base_core.Status.loading));
        await ImageGallerySaver.saveImage(bytes);
        emit(state.copyWith(status: base_core.Status.success));
      } on Exception catch (e) {
        emit(state.copyWith(status: base_core.Status.failure, errorMessage: e.toString()));
        throw Exception(e);
      }
    }
  }
}
