import 'package:findpro/feature/message/model/message_profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_model.g.dart';
part 'room_model.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  factory RoomModel({
    required MessageProfileModel hostProfile,
    required MessageProfileModel guestProfile,
    required String roomId,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);
}
