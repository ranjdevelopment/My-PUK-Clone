import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:testing_project/models/feed_model.dart';
import 'package:testing_project/views/login_view.dart';
import 'package:testing_project/widget/all_comment_widget.dart';
import 'package:testing_project/widget/single_comment.dart';
import 'package:testing_project/widget/text_widget.dart';

class FeedCardWidget extends StatelessWidget {
  const FeedCardWidget({
    super.key,
    required this.feedModel,
  });
  final FeedModel feedModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: feedModel.owner?.image == null
                      ? const AssetImage('assets/img/profile.png')
                      : NetworkImage(feedModel.owner!.image!),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: feedModel.owner?.fullName ?? "Unknown",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.public,
                              color: Colors.grey[400],
                              size: 18,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            TextWidget(
                              text: "21 hours ago",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                        const Gap(10.0),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          Get.to(LoginView());
                        },
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Color(0xFF4DBF71),
                        )),
                  ),
                ),
              ],
            ),
            TextWidget(
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              text: feedModel.content ?? "Untitled",
            ),
            const BottomIconWidget(),
            if (feedModel.totalComments?.isNotEmpty == true) ...[
              const Divider(
                thickness: 0.5,
              ),
              SingleCommentWidget(feedCardModel: feedModel, index: 0),
            ],
          ]),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}

class BottomIconWidget extends StatelessWidget {
  const BottomIconWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: "Like",
                color: Colors.grey[400],
              ),
              const SizedBox(
                width: 10.0,
              ),
              TextWidget(
                text: "46 share",
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                    child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icons/share.png'),
                )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                AllCommentWidget.showBottomSheet(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                    child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icons/chat.png'),
                )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                    child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icons/like.png'),
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
