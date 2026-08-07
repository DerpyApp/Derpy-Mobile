import 'package:intl/intl.dart';

class AppFormatter {
  AppFormatter._();

  static String date(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String time(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  static String dateTime(DateTime date) {
    return DateFormat('dd MMM yyyy • hh:mm a').format(date);
  }

  static String price(num value, {String symbol = 'EGP'}) {
    return '$symbol ${value.toStringAsFixed(2)}';
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}
