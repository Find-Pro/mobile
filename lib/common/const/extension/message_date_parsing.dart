import 'package:easy_localization/easy_localization.dart';

extension MessageDateParsing on String {
  String get formatMessageDate {
    final dateTime = DateTime.parse(this);

    final formattedDate =
        '${dateTime.day} ${'months'.tr()[dateTime.month - 1]}';
    final formattedTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

    return '$formattedDate $formattedTime';
  }
}
