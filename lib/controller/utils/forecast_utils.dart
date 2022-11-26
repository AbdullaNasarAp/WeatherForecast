import 'package:intl/intl.dart';

class Utils {
  static String appId = "800798244cc2459ee514266f09d5e0a3";

  static String getFormatDate(DateTime dateTime) {
    return new DateFormat("EEEE,MMMM ,d,y").format(dateTime);
  }
}
