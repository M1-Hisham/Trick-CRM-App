import 'package:intl/intl.dart';

/// Format the date
String formattedDateHelper(String? date) {
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(date ?? "0000-00-00T00:00:21Z")
      .toLocal();
  String formattedDate = DateFormat("yyyy-MM-dd, h:mm:ss a").format(dateValue);
  return formattedDate;
}

String formattedDateHelperMM(String? date) {
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(date ?? "0000-00-00T00:00:21Z")
      .toLocal();
  String formattedDate = DateFormat("yyyy-MM-dd").format(dateValue);
  return formattedDate;
}

String formattedDateHelperTHMM(String? date) {
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(date ?? "0000-00-00T00:00:21Z")
      .toLocal();
  String formattedDate = DateFormat("yyyy-MM-dd, h:mm a").format(dateValue);
  return formattedDate;
}

String formattedDateHelperTH(String? date) {
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(date ?? "0000-00-00T00:00:21Z")
      .toLocal();
  String formattedDate = DateFormat("yyyy-MM-dd, h a").format(dateValue);
  return formattedDate;
}
