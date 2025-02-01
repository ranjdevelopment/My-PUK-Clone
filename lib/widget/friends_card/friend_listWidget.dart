import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:testing_project/GetX/controllers/feed_card_controller.dart';
import 'package:testing_project/widget/friends_card/friend_widget.dart';

class FriendListwidget extends StatelessWidget {
  const FriendListwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FeedCardController.to,
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.myFriendModels.length,
            itemBuilder: (
              context,
              index,
            ) {
              return FriendWidget(
                friendModel: controller.myFriendModels[index],
                index: index,
              );
            },
          );
        });
  }
}
