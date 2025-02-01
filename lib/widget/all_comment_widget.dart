import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:testing_project/models/feed_model.dart';
import 'package:testing_project/widget/text_widget.dart';

class AllCommentWidget extends StatelessWidget {
  const AllCommentWidget({
    super.key,
    this.commentModels,
  });

  static Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return const AllCommentWidget();
      },
    );
  }

  final FeedModel? commentModels;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: commentModels?.totalComments?[0].image == null
                    ? const AssetImage('assets/img/image.jpg')
                    : NetworkImage(commentModels!.owner!.image!),
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(15.0),
                  TextWidget(
                    text: commentModels?.totalComments?[0].owner?.fullName ??
                        "Untitled",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: "21 hours ago",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  )
                ],
              ),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF4DBF71),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ))),
              ),
            ],
          ),
          const Gap(15.0),
          Expanded(
            child: TextWidget(
              text: commentModels?.content ?? "Untitled",
              fontSize: 16,
              maxLines: 10,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
