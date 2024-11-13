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
  jobGetUserJobs('/job/getUserJobs'),
  jobGetFollowingJobs('/job/getFollowingJobs'),
  jobGet('/job/get'),
  login('/login'),
  loginWithGoogle('/login/google'),
  loginWithApple('/login/apple'),
  messageStartChatRoom('/message/startChatRoom'),
  messageChatRooms('/message/chatRooms'),
  photoProfile('/photo/profilePicture'),
  photoCover('/photo/coverPicture'),
  register('/register'),
  registerWithGoogle('/register/google'),
  registerWithApple('/register/apple'),
  search('/search'),
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
