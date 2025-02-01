import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_project/GetX/controllers/feed_card_controller.dart';
import 'package:testing_project/models/feed_model.dart';
import 'package:testing_project/widget/feed_card/feed_card_widget.dart';

class FeedCardListWidget extends StatelessWidget {
  const FeedCardListWidget({
    super.key,
    this.feedModels,
  });
  final List<FeedModel>? feedModels;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FeedCardController.to,
        builder: (controller) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.feedCardModels.length,
            itemBuilder: (context, index) {
              return FeedCardWidget(
                  feedModel: controller.feedCardModels[index]);
            },
          );
        });
  }
}
