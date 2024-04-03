import 'package:intl/intl.dart';

class Utils {
  static getFormattedDate(String date, {String dateFormat = "yyyy-MMM-dd"}) {
    try {
      return DateFormat(dateFormat).format(DateTime.parse(date));
    } catch (e) {
      return "";
    }
  }

  static getPostFormattedTime(DateTime createdDate) {
    final now = DateTime.now();
    final difference = now.difference(createdDate);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      final days = difference.inDays;
      return '${days == 1 ? 'Yesterday' : '$days days ago'} ';
    } else if (difference.inHours > 0) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
}
