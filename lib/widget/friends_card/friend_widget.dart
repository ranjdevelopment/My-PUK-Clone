import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:testing_project/GetX/controllers/friend_controller.dart';
import 'package:testing_project/models/my_friend_model.dart';
import 'package:testing_project/widget/text_widget.dart';

class FriendWidget extends StatefulWidget {
  const FriendWidget(
      {super.key, required this.friendModel, required this.index});
  final MyFriendModel friendModel;
  final int index;

  @override
  State<FriendWidget> createState() => _FriendWidgetState();
}

int tabIndex = 0;
bool isSelected = false;

class _FriendWidgetState extends State<FriendWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FriendController.to,
        builder: (controller) {
          return ListTile(
            title: TextWidget(
              text: widget.friendModel.name ?? "unknown",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            subtitle: TextWidget(
              text: widget.friendModel.bio ?? "No bio",
              color: Colors.grey[500],
            ),
            leading: CircleAvatar(
                radius: 24,
                backgroundImage: widget.friendModel.image == null
                    ? const AssetImage('assets/img/profile.png')
                    : NetworkImage(widget.friendModel.image!)),
            trailing: InkWell(
              onTap: () {
                //controller.toggleClicked(widget.index);
                setState(() {
                  tabIndex = widget.index;
                  isSelected = !isSelected;
                });
              },
              child: Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color:
                      isSelected ? Colors.grey[200] : const Color(0xFF4DBF71),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: TextWidget(
                    text: isSelected ? "Unfriend" : "Friend",
                    color: isSelected ? const Color(0xFF4DBF71) : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
