import 'package:findpro/common/services/model/user_model.dart';
import 'package:findpro/feature/home/model/job_model.dart';

abstract class SearchOperation {
  Future<List<UserModel>?> user(String search);
  Future<List<JobModel>?> job(String search);
}
