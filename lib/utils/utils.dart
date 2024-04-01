import 'package:intl/intl.dart';

class Utils {
  static Map<dynamic, String> imageMap = 
  {
    'Partially cloudy': 'assets/images/nightRain.png',
    'Overcast': 'assets/images/sunSlowRain.png',
    'Clear': 'assets/images/wind.png',
    'null': 'assets/images/nightStatRain.png',
  };

  static String formateDate(DateTime date)
  {
    String formattedDate = DateFormat('EEEE d MMM').format(date);
    return formattedDate;
  }

  static String extractDate(String date)
  {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('d').format(dateTime);
    return formattedDate;
  }

  static String formateDay(String date)
  {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('EEEE').format(dateTime);
    String abbreviatedDay = formattedDate.substring(1, 3);
    return abbreviatedDay;
  }
  
}