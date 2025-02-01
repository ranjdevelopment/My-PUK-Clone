import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:testing_project/widget/appBar_widget.dart';
import 'package:testing_project/widget/tabBar_widget.dart';
import 'package:testing_project/widget/text_widget.dart';

class HomeView extends StatelessWidget {
  static const route = '/home-view';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarWidget(
          title: "My Puk",
          bgColor: Colors.white,
          leading: IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey[300])),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          actions: IconButton(
            onPressed: () {},
            iconSize: 27,
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey[300])),
            icon: const Icon(Icons.search_outlined),
          ),
          centerTitle: false,
          context,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: "Discussion Panel",
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700),
              const Gap(10),
              const Expanded(child: TabBarViewWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
