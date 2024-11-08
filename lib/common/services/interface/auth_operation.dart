import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/services/model/request/register_request.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';

abstract class AuthOperation {
  Future<UpdateProfileResponse?> login(
    LoginRequest loginRequest,
  );

  Future<UpdateProfileResponse?> register(
    RegisterRequest registerRequest,
  );
  Future<UpdateProfileResponse?> registerWithToken(
      String token, EndPointEnums endPoint);
  Future<UpdateProfileResponse?> loginWithToken(
      String token, EndPointEnums endPoint);
}
