import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required dynamic mess,
  Color? backgroundColor,
  ToastGravity? gravity,
  Toast? toastLength,
}) {
  Fluttertoast.showToast(
    msg: mess.toString(),
    toastLength: toastLength ?? Toast.LENGTH_LONG,
    gravity: gravity ?? ToastGravity.BOTTOM,
    backgroundColor: backgroundColor ?? Colors.black.withOpacity(.7),
  );
}
