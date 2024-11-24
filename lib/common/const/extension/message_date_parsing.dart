import 'package:findpro/common/const/months_list.dart';

extension MessageDateParsing on String {
  String get formatMessageDate {
    final dateTime = DateTime.parse(this);

    final formattedDate =
        '${dateTime.day} ${MonthsList.months[dateTime.month - 1]}';
    final formattedTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

    return '$formattedDate $formattedTime';
  }
}
