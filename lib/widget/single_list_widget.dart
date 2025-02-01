import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:testing_project/models/feed_model.dart';
import 'package:testing_project/widget/text_widget.dart';

class SinlgeListComment extends StatelessWidget {
  const SinlgeListComment({super.key, required this.feedModels});
  final FeedModel feedModels;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        feedModels.totalComments?.length ?? 0,
        (index) {
          return Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        feedModels.totalComments?[index].image ??
                            'assets/img/profile.png',
                      ),
                    ),
                    const Gap(8.0),
                    TextWidget(
                      text:
                          feedModels.totalComments?[index].content ?? 'Utitled',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  ],
                ),
                Expanded(
                  child: TextWidget(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text:
                        feedModels.totalComments?[index].content ?? 'Untitled',
                    color: Colors.grey[500],
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const TextWidget(
                        text: "Like",
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const TextWidget(
                        text: "Reply",
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
