import 'package:flutter/material.dart';
import 'package:testing_project/widget/appBar_widget.dart';
import 'package:testing_project/widget/text_widget.dart';

class PostOpinionWidget extends StatelessWidget {
  static const route = '/post-opinion';
  const PostOpinionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        bgColor: Colors.white,
        context,
        title: "Post an Opinion",
        titleColor: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        centerTitle: false,
        leading: IconButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.grey[300])),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: InkWell(
          onTap: () {},
          child: Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF4DBF71),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const Center(
              child: TextWidget(
                text: "Post",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
