import 'package:intl/intl.dart';

String dateToStringTime(int dateMilliSecond){
  var format = DateFormat('dd/MM/yy');
  var dateString = format.format(DateTime.fromMillisecondsSinceEpoch(dateMilliSecond));
  return dateString;
}