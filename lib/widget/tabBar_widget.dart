import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:testing_project/widget/all_user_list.dart';
import 'package:testing_project/widget/button_list.dart';
import 'package:testing_project/widget/friends_card/friend_listWidget.dart';
import 'package:testing_project/widget/feed_card/feed_card_list_widget.dart';
import 'package:testing_project/views/post_opinion_view.dart';
import 'package:testing_project/widget/text_widget.dart';

class TabBarViewWidget extends StatefulWidget {
  const TabBarViewWidget({super.key});
  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: const Color(0xFF4DBF71),
            unselectedLabelColor: Colors.grey[600],
            labelColor: const Color(0xFF4DBF71),
            tabs: const [
              TextWidget(
                text: "Feed",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: "Friends",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: "All Users",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ],
            controller: controller,
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              children: const [
                //First Tab
                FirstTab(),
                //Second Tab
                FriendListwidget(),

                //Third Tab
                AllUserList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            GestureDetector(
              onTap: () {
                Get.to(() => const PostOpinionWidget());
              },
              child: TextWidget(
                text: "What's on your mind, Hashem",
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),
            const Gap(16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ButtonListWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const FeedCardListWidget(),
          ],
        ),
      ),
    );
  }
}
