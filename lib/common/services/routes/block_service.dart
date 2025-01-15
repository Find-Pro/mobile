import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/block_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

class BlockService implements BlockOperation {
  BlockService._();
  static final BlockService instance = BlockService._();
  @override
  Future<SuccessAndMessageResponse?> block(int otherId, bool block) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.block,
      data: {
        'userId': userId,
        'otherUserId': otherId,
        'block': block,
      },
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<List<int>?> list(int userId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.blockList,
      data: {'userId': userId},
    );
    if (responseData != null && responseData['success'] == true) {
      if (responseData['result'] is List) {
        return List<int>.from(responseData['result'] as Iterable);
      }
    }
    return null;
  }
}
