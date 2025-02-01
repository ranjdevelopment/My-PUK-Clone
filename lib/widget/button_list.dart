import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:testing_project/GetX/controllers/button_tab_controller.dart';
import 'package:testing_project/GetX/controllers/feed_card_controller.dart';

class ButtonListWidget extends StatefulWidget {
  const ButtonListWidget({
    super.key,
  });

  @override
  State<ButtonListWidget> createState() => _ButtonListWidgetState();
}

class _ButtonListWidgetState extends State<ButtonListWidget> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ButtonTabController.to,
        builder: (controller) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.buttonName.length,
                (index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        tabIndex = index;
                      });
                      FeedCardController.to.feedCardModels =
                          await FeedCardController.to.getFeed(
                              categoryId:
                                  "9da2f103-0991-4111-b4bb-2f8172975389");
                      FeedCardController.to.update();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        border: tabIndex == index
                            ? null
                            : Border.all(color: Colors.grey.shade200, width: 4),
                        color: tabIndex == index
                            ? const Color(0xFF4DBF71)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Center(
                        child: Text(
                          controller.buttonName[index],
                          style: TextStyle(
                            color:
                                tabIndex == index ? Colors.white : Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
        });
  }
}
