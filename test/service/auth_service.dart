// import 'package:findpro/common/const/enum/api_request_method_enum.dart';
// import 'package:findpro/common/const/enum/end_point_enums.dart';
// import 'package:findpro/common/services/interface/auth_operation.dart';
// import 'package:findpro/common/services/manager/network_manager.dart';
// import 'package:findpro/common/services/model/request/login_request.dart';
// import 'package:findpro/common/services/routes/auth_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// // Mock sınıf oluşturmak için
// class MockNetworkManager extends Mock implements NetworkManager {
//   late Dio dio;
//
//   MockNetworkManager() {
//     dio = MockDio();
//   }
// }
//
// void main() {
//   late MockNetworkManager mockNetworkManager;
//   late AuthOperation authService;
//
//   setUp(() {
//     mockNetworkManager = MockNetworkManager();
//     authService = AuthService.instance;
//     NetworkManager._dio = mockNetworkManager; // Mock'u bağlama
//   });
//
//   group('AuthService Tests', () {
//     test('Login Success Test', () async {
//       // Mock yanıt
//       final mockResponse = {
//         'id': 1,
//         'name': 'John Doe',
//         'email': 'john.doe@example.com',
//       };
//
//       // Mock metodu tanımlama
//       when(mockNetworkManager.baseRequest(
//         APIRequestMethod.post,
//         EndPointEnums.login,
//         data: anyNamed('data'),
//       )).thenAnswer((_) async => mockResponse);
//
//       // Test edilecek giriş bilgileri
//       final loginRequest = LoginRequest(
//         email: 'test@example.com',
//         password: 'password123',
//       );
//
//       final result = await authService.login(loginRequest);
//
//       // Beklentiler
//       expect(result, isNotNull);
//       expect(result!.id, equals(1));
//       expect(result.name, equals('John Doe'));
//       expect(result.email, equals('john.doe@example.com'));
//
//       // Mock metodunun çağrıldığını doğrula
//       verify(mockNetworkManager.baseRequest(
//         APIRequestMethod.post,
//         EndPointEnums.login,
//         data: anyNamed('data'),
//       )).called(1);
//     });
//
//     test('Login Failure Test', () async {
//       // Mock hata durumu
//       when(mockNetworkManager.baseRequest(
//         APIRequestMethod.post,
//         EndPointEnums.login,
//         data: anyNamed('data'),
//       )).thenAnswer((_) async => null);
//
//       final loginRequest = LoginRequest(
//         email: 'wrong@example.com',
//         password: 'wrongpassword',
//       );
//
//       final result = await authService.login(loginRequest);
//
//       // Beklentiler
//       expect(result, isNull);
//
//       // Mock metodunun çağrıldığını doğrula
//       verify(mockNetworkManager.baseRequest(
//         APIRequestMethod.post,
//         EndPointEnums.login,
//         data: anyNamed('data'),
//       )).called(1);
//     });
//   });
// }
