import 'package:get/get.dart';

class ButtonTabController extends GetxController {
  static ButtonTabController get to => Get.find(tag: 'btn-tab-controller');

  var tabIndex = 0;
  var isSelected = false;
  void toggleSelected(int index) {
    tabIndex = tabIndex;
    update();
  }

   final List<String> buttonName = [
      'Article',
      'Character',
      'Event',
      'Job',
      'Vlounche'
    ];
}
