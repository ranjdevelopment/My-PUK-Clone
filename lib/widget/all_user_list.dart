import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:testing_project/GetX/controllers/feed_card_controller.dart';
import 'package:testing_project/widget/all_user_widget.dart';

class AllUserList extends StatelessWidget {
  const AllUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FeedCardController.to,
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.allUserModels.length,
            itemBuilder: (
              context,
              index,
            ) {
              return AllUserWidget(
                  allUserModel: controller.allUserModels[index], index: index);
            },
          );
        });
  }
}
