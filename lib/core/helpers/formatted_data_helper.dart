import 'package:intl/intl.dart';

/// Format the date
String formattedDateHelper(String? date) {
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(date ?? "0000-00-00T00:00:21Z")
      .toLocal();
  String formattedDate = DateFormat("yyyy-MM-dd, h:mm:ss a").format(dateValue);
  return formattedDate;
}
