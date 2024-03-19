import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:base_core/src/base_enum.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class AppHelper {
  static Size getSizeByKey(GlobalKey key) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    final size = renderBox?.size;
    return size ?? Size.zero;
  }

  static bool compareDate(String startDate, String endDate) {
    final start = DateFormat('MM-yyyy').parse(startDate);
    final end = DateFormat('MM-yyyy').parse(endDate);
    return start.isBefore(end);
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  static bool checkFormatDateOfBirth(String value) {
    final regularExpression = RegExp(r'^(3[01]|[12][0-9]|0[1-9])-(1[0-2]|0[1-9])-[0-9]{4}$');
    return regularExpression.hasMatch(value);
  }

  static bool checkFormatTimeWorking(String value) {
    final regularExpression = RegExp(r'^(1[0-2]|0[1-9])-[0-9]{4}$');
    return regularExpression.hasMatch(value);
  }

  static bool checkFormatEmail(String value) {
    final regularExpression = RegExp(r'^[A-Za-z0-9+_.-]+@(.+)$');
    return regularExpression.hasMatch(value);
  }

  static String convertDate(String date) {
    if (date == '' || date.trim() == '') {
      return '';
    } else {
      final time = DateFormat('dd/MM/yyyy').parse(date);
      final timeConverted = DateFormat('yyyy-MM-dd').format(time);
      return timeConverted;
    }
  }

  static String convertDateReverse(String date) {
    if (date == '' || date.trim() == '') {
      return '';
    } else {
      final time = DateFormat('yyyy-MM-dd').parse(date);
      final timeConverted = DateFormat('dd/MM/yyyy').format(time);
      return timeConverted;
    }
  }

  static String convertDateTimeToDate(String datetime) {
    try {
      final originalDate = DateTime.parse(datetime);
      final formattedDate = DateFormat('dd/MM/yyyy').format(originalDate);
      return formattedDate;
    } catch (e) {
      print('Error occurred while parsing the date: $e');
      return '';
    }
  }

  static String convertDateMMYYYY(String date) {
    if (date == '' || date.trim() == '') {
      return '';
    } else {
      final time = DateFormat('MM-yyyy').parse(date);
      final timeConverted = DateFormat('yyyy-MM').format(time);
      return '$timeConverted-01';
    }
  }

  Future<Size> getImageDimension({required String url}) {
    final completer = Completer<Size>();
    final image = Image.network(url);
    image.image.resolve(ImageConfiguration.empty).addListener(
      ImageStreamListener(
        (ImageInfo imageInfo, bool synchronousCall) {
          final myImage = imageInfo.image;
          final size = Size(
            myImage.width.toDouble(),
            myImage.height.toDouble(),
          );
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  static EnumDataSourceType getTypePath(String path) {
    final uri = Uri.parse(path);
    final isFile = uri.scheme == '' || uri.scheme == 'file';
    final isNetWork = uri.scheme == 'http' || uri.scheme == 'https';
    if (isFile) return EnumDataSourceType.file;
    if (isNetWork) return EnumDataSourceType.network;
    throw ArgumentError('Invalid path: $path');
  }

  /**
   * format : dd/MM/yyyy
   * output : 01/01/2023
   */
  static Future<String> datePicker({
    String? format,
    required BuildContext context,
    String? fieldLabelText,
    String? errorInvalidText,
    String? errorFormatText,
  }) async {
    var selectedDate = DateTime.now();
    final formatDate = format ?? 'dd/MM/yyyy';
    var date = DateFormat(formatDate).format(DateTime.now());

    final picked = await showDatePicker(
      context: context,
      locale: const Locale('vi', '24'),
      initialDate: selectedDate,
      fieldHintText: formatDate,
      keyboardType: TextInputType.datetime,
      fieldLabelText: fieldLabelText ?? 'Nhập ngày',
      errorInvalidText: errorInvalidText ?? 'Ngày tháng sai định dạng!',
      errorFormatText: errorFormatText ?? 'Ngày tháng sai định dạng!',
      firstDate: DateTime(selectedDate.year - 100, 8),
      lastDate: DateTime(selectedDate.year + 100),
    );

    if (picked != selectedDate) {
      selectedDate = picked!;
      date = DateFormat(formatDate).format(picked);
    }

    return date;
  }

  static Future<void> yearPicker({
    required BuildContext context,
    String? title,
    required DateTime selectedDate,
    required void Function(DateTime) onChanged,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ''),
          content: Container(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 1, 1),
              initialDate: DateTime.now(),
              selectedDate: selectedDate,
              onChanged: (DateTime dateTime) {
                onChanged(dateTime);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  static bool compareDateWithToday(String value) {
    if (value.length < 10) {
      return false;
    } else {
      final dateToday = DateFormat('dd-MM-yyyy').format(DateTime.now());
      final timeToday = DateFormat('dd-MM-yyyy').parse(dateToday);

      final end = DateFormat('dd-MM-yyyy').parse(value);
      return timeToday.isBefore(end) || timeToday.isAtSameMomentAs(end);
    }
  }

  static bool compareDateOfBi(String value) {
    final date = DateFormat('MM-dd-yyyy').format(DateTime.now());
    if (value == date) {
      return true;
    } else {
      return false;
    }
  }

  static void copyPhoneExtension(String? content, BuildContext context) {
    Clipboard.setData(ClipboardData(text: content ?? '')).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Số điện thoại đã được sao chép!")));
    });
  }

  static void copyMailExtension(String? content, BuildContext context) {
    Clipboard.setData(ClipboardData(text: content ?? '')).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email đã được sao chép!")));
    });
  }

  static Future<void> makeCallExtension(String contactNumber) async {
    final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await UrlLauncher.canLaunch(_phoneUri.toString())) await UrlLauncher.launch(_phoneUri.toString());
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  static Future<void> sendMessageExtension(String contactNumber) async {
    final Uri _phoneUri = Uri(scheme: "sms", path: contactNumber);
    try {
      if (await UrlLauncher.canLaunch(_phoneUri.toString())) await UrlLauncher.launch(_phoneUri.toString());
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  static Future<void> sendMailExtension(String contactNumber) async {
    final Uri _phoneUri = Uri(
      scheme: 'mailto',
      path: contactNumber,
    );
    try {
      if (await UrlLauncher.canLaunch(_phoneUri.toString())) await UrlLauncher.launch(_phoneUri.toString());
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  /**
   * dateString : 2020-07-14T10:20:26.353
   * format     : HH:mm dd/MM/yyyy
   * return     : 10:10 14/07/2020
   */
  static String convertDateFormat({
    required String dateString,
    String? format,
  }) {
    try {
      final originalDate = DateTime.parse(dateString);
      final dateFormat = format ?? 'HH:mm dd/MM/yyyy';
      final formattedDate = DateFormat(dateFormat).format(originalDate);
      return formattedDate;
    } catch (e) {
      print('Error occurred while parsing the date: $e');
      return '';
    }
  }

  /**
   * format : yyyy-MM-ddTHH:mm:ss.SSS
   * return : 2023-07-17T11:39:14.473
   */
  static String getCurrentDateTimeByFormat({String? format}) {
    final now = DateTime.now();
    final dateFormat = format ?? 'yyyy-MM-ddTHH:mm:ss.SSS';
    final formattedDate = DateFormat(dateFormat).format(now);
    return formattedDate;
  }

  static void jumpToTop(ScrollController controller) {
    controller.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 350),
    );
  }

  static void jumpToBottom(ScrollController controller) {
    controller.animateTo(
      controller.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 350),
    );
  }

  static void jumpToPosition(ScrollController controller, double position) {
    final clampedPosition = position.clamp(
      0,
      controller.position.maxScrollExtent,
    );
    controller.animateTo(
      clampedPosition.toDouble(),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  static Color getRandomColor() {
    final random = Random();
    final colorsList = Colors.primaries;
    final randomIndex = random.nextInt(colorsList.length);
    return colorsList[randomIndex];
  }
}
