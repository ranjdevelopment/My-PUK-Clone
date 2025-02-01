import 'package:get/get.dart';
import 'package:testing_project/models/my_friend_model.dart';

class FriendController extends GetxController {
  static FriendController get to => Get.find(tag: 'friend-controller');

  var isSelected = false;
  var tabIndex = 0;

  void toggleClicked(int index) {
    tabIndex = index;
    isSelected = !isSelected;
    update();
  }

  final List<MyFriendModel> friendList = [
    MyFriendModel(
      name: 'Flores Juanita',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/friends1.png',
      isSelect: true,
    ),
    MyFriendModel(
      name: 'Black, Marvin',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/image2.png',
      isSelect: false,
    ),
    MyFriendModel(
      name: 'Black, Marvin',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/image3.png',
      isSelect: false,
    ),
    MyFriendModel(
      name: 'Miles, Esther',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/image4.png',
      isSelect: false,
    ),
    MyFriendModel(
      name: 'Henry, Arthur',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/image5.png',
      isSelect: false,
    ),
    MyFriendModel(
      name: 'Cooper, Kristin',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/image6.png',
      isSelect: false,
    ),
    MyFriendModel(
      name: 'Cooper, Kristin',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/image7.png',
      isSelect: false,
    ),
    MyFriendModel(
      name: 'Bafel Talabani',
      bio: "Leader of the Patriotic Union of Kurdistan",
      image: 'assets/img/image8.png',
      isSelect: false,
    ),
  ];
}
