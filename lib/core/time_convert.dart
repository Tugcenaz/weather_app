import 'package:intl/intl.dart';

String dateToStringTime(int dateMilliSecond) {
  var format = DateFormat('d/M');
  var dateString =
      format.format(DateTime.fromMillisecondsSinceEpoch(dateMilliSecond));

  return dateString;
}

String dateToStringTimeWithoutYear(int dateMilliSecond) {
  var month = DateFormat('MM');
  var formatMonth =
      month.format(DateTime.fromMillisecondsSinceEpoch(dateMilliSecond));
  String monthString = 'Ocak';
  switch (formatMonth) {
    case '01':
      monthString = 'Ocak';
      break;
    case '02':
      monthString = 'Şubat';
      break;
    case '03':
      monthString = 'Mart';
      break;
    case '04':
      monthString = 'Nisan';
      break;
    case '05':
      monthString = 'Mayıs';
      break;
    case '06':
      monthString = 'Haziran';
      break;
    case '07':
      monthString = 'Temmuz';
      break;
    case '08':
      monthString = 'Ağustos';
      break;
    case '09':
      monthString = 'Eylül';
      break;
    case '10':
      monthString = 'Ekim';
      break;
    case '11':
      monthString = 'Kasım';
      break;
    case '12':
      monthString = 'Aralık';
      break;
  }

  var format = DateFormat('dd');
  var dayString =
      format.format(DateTime.fromMillisecondsSinceEpoch(dateMilliSecond));
  Map<String, dynamic> dayAndMonth = {'month': monthString, 'day': dayString};
  return '${dayAndMonth['day']}  ${dayAndMonth['month']}';
}

String timeToString(String formattedString) {
  var format = DateFormat('j');
  var timeString = format.format(DateTime.parse(formattedString));
  return timeString;
}
