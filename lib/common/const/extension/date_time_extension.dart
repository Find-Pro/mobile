extension DateTimeFormatting on DateTime {
  String get formattedDate =>
      "${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year";
  String get formattedTime =>
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
}
