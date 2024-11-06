import 'package:findpro/common/const/api_key.dart';

enum EndPointEnums {
  userProfile('/user/profile'),
  userUpdate('/user/updateProfile'),
  userUpdatePassword('/user/updatePassword'),
  userList('/user/list'),
  commentAdd('/comment/add'),
  commentGetComments('/comment/getComments'),
  commentDelete('/comment/delete'),
  followFollow('/follow/'),
  followFollowing('/follow/following/'),
  followFollowers('/follow/followers/'),
  jobAdd('/job/add'),
  jobDelete('/job/delete'),
  jobComplete('/job/complete'),
  jobEdit('/job/edit'),
  login('/login'),
  messageList('/message/list/:userId'),
  messageBlock('/message/blockUser'),
  messageDelete('/message/delete/:messageId'),
  photoProfile('/photo/profilePicture'),
  photoCover('/photo/coverPicture'),
  register('/register'),
  registerWithGoogle('/register/google'),
  registerWithApple('/register/apple'),
  searchJob('/search/job'),
  searchUser('/search/user'),
  supportUser('/support/user'),
  supportComment('/support/comment'),
  supportGeneral('/support/general');

  const EndPointEnums(this.value);
  final String value;

  String get fullUrl {
    const baseUrl = ApiKey.baseUrl;
    return '$baseUrl$value';
  }
}
