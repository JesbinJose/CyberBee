import 'package:intl/intl.dart';

String? getDate(DateTime date, DateTime old, bool isLast) {
  DateFormat format = DateFormat("MMMM dd, yyyy");
  if (isLast) return format.format(date);
  final int diff = date.day-old.day;
  if (diff != 0) {
    final int datediff = old.day - DateTime.now().day;
    if (datediff == 0) {
      return 'Today';
    } else if (datediff == 1) {
      return 'Yesterday';
    } else {
      return format.format(old);
    }
  }
  return null;
}