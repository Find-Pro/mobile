import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/auth_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/services/model/request/register_request.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';

class AuthService implements AuthOperation {
  AuthService._();
  static final AuthService instance = AuthService._();
  @override
  Future<UpdateProfileResponse?> login(LoginRequest loginRequest) async {
    final response = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.login,
      data: {
        'email': loginRequest.email,
        'password': loginRequest.password,
      },
    );

    return response != null
        ? UpdateProfileResponse.fromJson(response)
        : null;
  }

  @override
  Future<UpdateProfileResponse?> register(
      RegisterRequest registerRequest) async {
    final response = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.register,
      data: {
        'fullName': registerRequest.fullName,
        'email': registerRequest.email,
        'password': registerRequest.password,
        'isMaster': registerRequest.isMaster,
      },
    );
    return response != null
        ? UpdateProfileResponse.fromJson(response)
        : null;
  }

  @override
  Future<UpdateProfileResponse?> registerWithToken(
      String token, EndPointEnums endPoint) async {
    final response = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      endPoint,
      data: {
        'token': token,
        'password': token,
      },
    );
    return response != null
        ? UpdateProfileResponse.fromJson(response)
        : null;
  }

  @override
  Future<UpdateProfileResponse?> loginWithToken(
      String token, EndPointEnums endPoint) async {
    final response = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      endPoint,
      data: {
        'token': token,
      },
    );
    return response != null
        ? UpdateProfileResponse.fromJson(response)
        : null;
  }
}
