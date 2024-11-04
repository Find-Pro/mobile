import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/search_operation.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:findpro/feature/home/model/job_model.dart';
import 'package:vexana/vexana.dart';

class SearchService implements SearchOperation {
  SearchService(this._networkManager);
  final INetworkManager _networkManager;

  @override
  Future<List<UserModel>?> user(String search) async {
    final response =
        await _networkManager.send<UserModel, List<UserModel>>(
      EndPointEnums.searchUser.fullUrl,
      parseModel: UserModel(),
      method: RequestType.POST,
      data: {'searchString': search},
    );
    return response.data;
  }

  @override
  Future<List<JobModel>?> job(String search) async {
    final response = await _networkManager.send<JobModel, List<JobModel>>(
      EndPointEnums.searchJob.fullUrl,
      parseModel: JobModel(),
      method: RequestType.POST,
      data: {'searchString': search},
    );
    return response.data;
  }
}
