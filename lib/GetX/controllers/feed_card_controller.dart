import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:testing_project/models/all_user_model.dart';
import 'package:testing_project/models/feed_model.dart';
import 'package:testing_project/models/my_friend_model.dart';
import 'package:testing_project/services/remote_service.dart';

class FeedCardController extends GetxController {
  static FeedCardController get to => Get.find(tag: 'post-card-controller');
  //feedModel
  List<FeedModel> feedCardModels = [];
  //friendModel
  List<MyFriendModel> myFriendModels = [];

  //allUserModel;
  List<AllUserModel> allUserModels = [];

  Future<FeedModel> getProfile() async {
    FeedModel profileModel;
    final response = await RemoteService()
        .get(url: 'http://192.168.1.5:2025/api/login', header: {
      'Authorization':
          'Bearer 9df938a1-a959-40dc-a589-1092970fdc87|cgwnxgAJcvN7BggIQuHoVnSjje53DSOhCquzOKQG',
    });

    Map<String, dynamic> map = json.decode(response.body);
    final profileMap = map['data']['profile'];
    profileModel = FeedModel.fromJson(profileMap);

    return profileModel;
  }

  @override
  void onReady() async {
    feedCardModels = await getFeed();
    myFriendModels = await getMyFriend();
    allUserModels = await getAllUser();
    update();
    log("feedModel: $feedCardModels");
    log("Friend: $myFriendModels");
    log("AllUser: $allUserModels");
    super.onReady();
  }

//Get Feed
  Future<List<FeedModel>> getFeed({String? categoryId}) async {
    List<FeedModel> feedCardModels = [];
    final response = await RemoteService()
        .get(url: 'http://192.168.1.5:2025/api/discussion/posts/feed', header: {
      'Authorization':
          'Bearer 9df938a1-a959-40dc-a589-1092970fdc87|cgwnxgAJcvN7BggIQuHoVnSjje53DSOhCquzOKQG'
    }, body: {
      if (categoryId != null) "category_id": categoryId
    });

    Map<String, dynamic> map = json.decode(response.body);
    log('Your feed model $feedCardModels');
    final List feedMap = map['data']['data'];
    feedCardModels =
        List<FeedModel>.from(feedMap.map((e) => FeedModel.fromJson(e)));

    return feedCardModels;
  }

  // Get My Freind
  Future<List<MyFriendModel>> getMyFriend() async {
    List<MyFriendModel> myFriendModels = [];

    final response = await RemoteService()
        .get(url: 'http://192.168.1.5:2025/api/discussion/friends', header: {
      'Authorization':
          'Bearer 9df938a1-a959-40dc-a589-1092970fdc87|cgwnxgAJcvN7BggIQuHoVnSjje53DSOhCquzOKQG',
    });
    Map<String, dynamic> map = json.decode(response.body);
    final List myFreindmap = map['data'];
    log('Your friend response is  $myFreindmap');
    myFriendModels = List<MyFriendModel>.from(
        myFreindmap.map((e) => MyFriendModel.fromJson(e)));

    return myFriendModels;
  }

  Future<List<AllUserModel>> getAllUser() async {
    List<AllUserModel> allUserModels = [];

    final response = await RemoteService()
        .get(url: 'http://192.168.1.5:2025/api/discussion/friends', header: {
      'Authorization':
          'Bearer 9df938a1-a959-40dc-a589-1092970fdc87|cgwnxgAJcvN7BggIQuHoVnSjje53DSOhCquzOKQG'
    });

    Map<String, dynamic> map = json.decode(response.body);
    final List allUserMap = map['data'];
    log('Your allUser response is  $allUserMap');

    allUserModels = List<AllUserModel>.from(
        allUserMap.map((e) => AllUserModel.fromJson(e)));

    return allUserModels;
  }
}
