import 'package:base_core/base_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_scanner_app/common/utils/permission_request_utils.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:permission_handler/permission_handler.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit() : super(QrCodeState.init());

  Future<void> openCamera(BuildContext context) async {
    emit(state.copyWith(status: Status.loading));
    await PermissionRequestUtil.checkCameraPermission(context).then((value) {
      if (value.isGranted || value.isLimited || value.isProvisional || value.isRestricted) {
        emit(state.copyWith(status: Status.success));
      } else {
        emit(state.copyWith(status: Status.failure));
      }
    });
  }

  void scan({QrCodeResultModel? data}) {
    emit(state.copyWith(status: Status.loading));
    if (data?.data != null && (data?.data?.isNotEmpty ?? false)) {
      data?.createDate = DateUtils.formatDateTimeToString();
      emit(state.copyWith(status: Status.success, data: data));
    }
  }
}
