import 'package:intl/intl.dart';

class AppDateUtils {
  static String timestampToDate(int timestamp) {
    final DateTime date;
    final is13Characters = timestamp.toString().length == 13;
    if (is13Characters) {
      date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    } else {
      date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    }
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static DateTime timestampToDateTime(int timestamp) {
    final DateTime date;
    final is13Characters = timestamp.toString().length == 13;
    if (is13Characters) {
      date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    } else {
      date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    }
    return date;
  }

  static String timeStampToTime(int timestamp) {
    final format = DateFormat('HH:mm');
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return format.format(date);
  }

  static int dateToTimestamp(String dateStr) {
    final formatter = DateFormat('dd/MM/yyyy');
    final date = formatter.parse(dateStr);
    return date.millisecondsSinceEpoch;
  }

  static DateTime toDateTime(String date) {
    final dateSplit = date.split('/');
    final day = int.parse(dateSplit[0]);
    final month = int.parse(dateSplit[1]);
    final year = int.parse(dateSplit[2]);
    return DateTime.utc(year, month, day);
  }

  static String timestampToDate12Numbers(int timestamp) {
    final DateTime date;
    date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }

  static String convertDateFromDataApi(String data) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final inputDate = inputFormat.parse(data);

    final outputFormat = DateFormat('dd-MM-yyyy');
    final outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static DateTime toMidnight(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  static bool isToday(DateTime date) {
    var now = DateTime.now();
    return date.day == now.day && date.month == now.month && date.year == now.year;
  }

  static bool isPastDay(DateTime date) {
    var today = toMidnight(DateTime.now());
    return date.isBefore(today);
  }

  static int convertToMin(String hrmin) {
    var tokens = hrmin.split(":");
    int minutes = 0;
    for (int i = tokens.length; i > 0; i--) {
      int value = int.parse(tokens[i - 1]);
      if (i == 1) {
        minutes += 60 * value;
      } else {
        minutes += value;
      }
    }
    return minutes;
  }

  static DateTime addDaysToDate(DateTime date, int days) {
    DateTime newDate = date.add(Duration(days: days));

    if (date.hour != newDate.hour) {
      var hoursDifference = date.hour - newDate.hour;

      if (hoursDifference <= 3 && hoursDifference >= -3) {
        newDate = newDate.add(Duration(hours: hoursDifference));
      } else if (hoursDifference <= -21) {
        newDate = newDate.add(Duration(hours: 24 + hoursDifference));
      } else if (hoursDifference >= 21) {
        newDate = newDate.add(Duration(hours: hoursDifference - 24));
      }
    }
    return newDate;
  }

  static DateTime getFirstDayOfCurrentMonth() {
    var dateTime = DateTime.now();
    dateTime = getFirstDayOfMonth(dateTime);
    return dateTime;
  }

  static DateTime getFirstDayOfNextMonth() {
    var dateTime = getFirstDayOfCurrentMonth();
    dateTime = addDaysToDate(dateTime, 31);
    dateTime = getFirstDayOfMonth(dateTime);
    return dateTime;
  }

  static DateTime getLastDayOfCurrentMonth() {
    return getLastDayOfMonth(DateTime.now());
  }

  static DateTime getLastDayOfNextMonth() {
    return getLastDayOfMonth(getFirstDayOfNextMonth());
  }

  static DateTime addMonths(DateTime fromMonth, int months) {
    DateTime firstDayOfCurrentMonth = fromMonth;
    for (int i = 0; i < months; i++) {
      firstDayOfCurrentMonth = getLastDayOfMonth(firstDayOfCurrentMonth).add(Duration(days: 1));
    }

    return firstDayOfCurrentMonth;
  }

  static DateTime getFirstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  static DateTime getLastDayOfMonth(DateTime month) {
    DateTime firstDayOfMonth = DateTime(month.year, month.month);
    DateTime nextMonth = firstDayOfMonth.add(Duration(days: 32));
    DateTime firstDayOfNextMonth = DateTime(nextMonth.year, nextMonth.month);
    return firstDayOfNextMonth.subtract(Duration(days: 1));
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day && date1.month == date2.month && date1.year == date2.year;
  }

  static bool isCurrentMonth(DateTime date) {
    var now = DateTime.now();
    return date.month == now.month && date.year == now.year;
  }

  static int calculateMaxWeeksNumberMonthly(DateTime startDate, DateTime endDate) {
    int monthsNumber = calculateMonthsDifference(startDate, endDate);

    List<int> weeksNumbersMonthly = <int>[];

    if (monthsNumber == 0) {
      return calculateWeeksNumber(startDate, endDate);
    } else {
      weeksNumbersMonthly.add(calculateWeeksNumber(startDate, getLastDayOfMonth(startDate)));

      DateTime firstDateOfMonth = getFirstDayOfMonth(startDate);
      for (int i = 1; i <= monthsNumber - 2; i++) {
        firstDateOfMonth = firstDateOfMonth.add(Duration(days: 31));
        weeksNumbersMonthly.add(calculateWeeksNumber(firstDateOfMonth, getLastDayOfMonth(firstDateOfMonth)));
      }

      weeksNumbersMonthly.add(calculateWeeksNumber(getFirstDayOfMonth(endDate), endDate));

      weeksNumbersMonthly.sort((a, b) => b.compareTo(a));
      return weeksNumbersMonthly[0];
    }
  }

  static int calculateMonthsDifference(DateTime startDate, DateTime endDate) {
    var yearsDifference = endDate.year - startDate.year;
    return 12 * yearsDifference + endDate.month - startDate.month;
  }

  static int calculateWeeksNumber(DateTime monthStartDate, DateTime monthEndDate) {
    int rowsNumber = 1;

    DateTime currentDay = monthStartDate;
    while (currentDay.isBefore(monthEndDate)) {
      currentDay = currentDay.add(Duration(days: 1));
      if (currentDay.weekday == DateTime.monday) {
        rowsNumber += 1;
      }
    }

    return rowsNumber;
  }

  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static DateTime findFirstDateOfPreviousWeek(DateTime dateTime) {
    final DateTime sameWeekDayOfLastWeek = dateTime.subtract(const Duration(days: 7));
    return findFirstDateOfTheWeek(sameWeekDayOfLastWeek);
  }

  static DateTime findFirstDateOfNextWeek(DateTime dateTime) {
    final DateTime sameWeekDayOfNextWeek = dateTime.add(const Duration(days: 7));
    return findFirstDateOfTheWeek(sameWeekDayOfNextWeek);
  }

  static DateTime findLastDateOfNextWeek(DateTime dateTime) {
    final DateTime sameWeekDayOfNextWeek = dateTime.add(const Duration(days: 7));
    return findLastDateOfTheWeek(sameWeekDayOfNextWeek);
  }

  static bool compareDate(DateTime firstDate, DateTime twoDate) {
    var firstTime = firstDate.millisecondsSinceEpoch;
    var twoTime = twoDate.millisecondsSinceEpoch;
    if (firstTime > twoTime) {
      return true;
    } else {
      return false;
    }
  }
}
