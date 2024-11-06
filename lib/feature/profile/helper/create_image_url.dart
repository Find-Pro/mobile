import 'package:findpro/common/const/api_key.dart';

final class CreateImageUrl {
  CreateImageUrl._init();
  static final CreateImageUrl _instance = CreateImageUrl._init();
  static CreateImageUrl get instance => _instance;

  String photo(String photoName) {
    return '${ApiKey.baseUrl}/uploads/$photoName';
  }
}
