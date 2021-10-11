import 'package:intl/intl.dart';

String formatDate({required DateTime? date, String format = 'yMd'}) {
  if (date == null) return "";
  return DateFormat(format).format(date);
}
