import 'package:intl/intl.dart';

class DataService {
  String DateToString(DateTime dateTime) {
    var duration = dateTime.timeZoneOffset;
    if (duration.isNegative) {
      return (DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(dateTime) +
          "-${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    } else {
      return (DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(dateTime) +
          "+${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    }
  }

  DateTime StringToDate(String stringDate) {
    return DateTime.parse(stringDate);
  }
}
