import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/services/model/request/register_request.dart';
import 'package:findpro/common/services/routes/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNetworkManager extends Mock implements NetworkManager {}

void main() {
  late AuthService authService;
  late MockNetworkManager mockNetworkManager;

  setUp(() {
    mockNetworkManager = MockNetworkManager();
    authService = AuthService.instance;
  });

  group('AuthService', () {
    test('login should return UpdateProfileResponse on success', () async {
      const loginRequest =
          LoginRequest(email: 'test@example.com', password: 'password');
      final mockResponse = {
        'success': true,
        'message': 'Login successful',
        'user': {
          'id': '1',
          'name': 'John Doe',
          'email': 'test@example.com',
        },
      };

      when(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.login,
        data: anyNamed('data'),
      )).thenAnswer((_) async => mockResponse);

      final response = await authService.login(loginRequest);

      expect(response, isNotNull);
      expect(response!.success, true);
      expect(response.message, 'Login successful');
      verify(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.login,
        data: {'email': 'test@example.com', 'password': 'password'},
      )).called(1);
    });

    test('register should return UpdateProfileResponse on success',
        () async {
      const registerRequest = RegisterRequest(
        email: 'test@example.com',
        password: 'password',
        fullName: 'John Doe',
        isMaster: false,
      );
      final mockResponse = {
        'success': true,
        'message': 'Registration successful',
        'user': {
          'id': '1',
          'name': 'John Doe',
          'email': 'test@example.com',
        },
      };

      when(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.register,
        data: anyNamed('data'),
      )).thenAnswer((_) async => mockResponse);

      final response = await authService.register(registerRequest);

      expect(response, isNotNull);
      expect(response!.success, true);
      expect(response.message, 'Registration successful');
      verify(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.register,
        data: {
          'email': 'test@example.com',
          'password': 'password',
          'fullName': 'John Doe',
          'isMaster': false,
        },
      )).called(1);
    });

    test('loginWithToken should return UpdateProfileResponse on success',
        () async {
      final mockResponse = {
        'success': true,
        'message': 'Token login successful',
        'user': {
          'id': '1',
          'name': 'John Doe',
          'email': 'test@example.com',
        },
      };

      when(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.loginWithGoogle,
        data: anyNamed('data'),
      )).thenAnswer((_) async => mockResponse);

      final response = await authService.loginWithToken(
          'some-token', EndPointEnums.loginWithGoogle);

      expect(response, isNotNull);
      expect(response!.success, true);
      expect(response.message, 'Token login successful');
      verify(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.loginWithGoogle,
        data: {'token': 'some-token'},
      )).called(1);
    });

    test(
        'registerWithToken should return UpdateProfileResponse on success',
        () async {
      final mockResponse = {
        'success': true,
        'message': 'Token registration successful',
        'user': {
          'id': '1',
          'name': 'John Doe',
          'email': 'test@example.com',
        },
      };

      when(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.registerWithGoogle,
        data: anyNamed('data'),
      )).thenAnswer((_) async => mockResponse);

      final response = await authService.registerWithToken(
        'some-token',
        'test@example.com',
        EndPointEnums.registerWithGoogle,
      );

      expect(response, isNotNull);
      expect(response!.success, true);
      expect(response.message, 'Token registration successful');
      verify(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.registerWithGoogle,
        data: {'token': 'some-token', 'email': 'test@example.com'},
      )).called(1);
    });

    test('should return null when API response is null', () async {
      when(mockNetworkManager.baseRequest(
        APIRequestMethod.post,
        EndPointEnums.registerWithGoogle,
        data: anyNamed('data'),
      )).thenAnswer((_) async => null);

      final response = await authService.login(const LoginRequest(
          email: 'test@example.com', password: 'password'));

      expect(response, isNull);
    });
  });
}
