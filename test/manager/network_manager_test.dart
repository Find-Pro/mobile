import 'package:dio/dio.dart';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([Dio])
void main() {
  late NetworkManager networkManager;
  late Dio dio;

  setUp(() async {
    await dotenv.load();
    dio = Dio();
    networkManager = NetworkManager.instance;
  });

  test('baseRequest başarıyla veri döndürmeli', () async {
    final response = Response(
      data: {'message': 'success'},
      statusCode: 200,
      requestOptions: RequestOptions(),
    );

    when(dio.request<Map<String, dynamic>>(
      ApiKey.baseUrl,
      data: anyNamed('data'),
      options: anyNamed('options'),
    )).thenAnswer((_) async => response);

    final result = await networkManager.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.login,
    );

    expect(result, {'message': 'success'});
  });
}
