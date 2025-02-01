import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:testing_project/GetX/controllers/auth_controller.dart';
import '../../../GetX/controllers/button_tab_controller.dart';
import '../../../GetX/controllers/friend_controller.dart';
import '../controllers/feed_card_controller.dart';

class BindingManager extends Bindings {
  @override
  void dependencies() {
    Get.put(FeedCardController(), tag: 'post-card-controller', permanent: true);
    Get.put(FriendController(), tag: 'friend-controller', permanent: true);
    Get.put(ButtonTabController(), tag: 'btn-tab-controller', permanent: true);
    Get.put(AuthController(), tag: 'auth-controller', permanent: true);
  }
}
