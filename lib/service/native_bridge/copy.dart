import 'package:flutter/services.dart';
import 'package:master_scanner_app/core/app_constant.dart';

class Copy {
  MethodChannel channel = MethodChannel(AppConstant.CHANNEL);
  void invoke(String data) {
    channel.invokeMethod(AppConstant.COPY, {AppConstant.COPY: data});
  }
}
