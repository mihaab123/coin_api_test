import 'package:intl/intl.dart';

class DataService {
  String DateToString(DateTime dateTime) {
    var duration = dateTime.timeZoneOffset;
    if (duration.isNegative) {
      return (DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime));
    } else {
      return (DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime));
    }
  }

  DateTime StringToDate(String stringDate) {
    return DateTime.parse(stringDate);
  }
}
