import 'package:flutter/material.dart';
import 'package:testing_project/models/all_user_model.dart';
import 'package:testing_project/widget/text_widget.dart';

class AllUserWidget extends StatefulWidget {
  const AllUserWidget(
      {super.key, required this.allUserModel, required this.index});
  final AllUserModel allUserModel;
  final int index;
  @override
  State<AllUserWidget> createState() => _AllUserWidgetState();
}

class _AllUserWidgetState extends State<AllUserWidget> {
  int tabIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextWidget(
        text: widget.allUserModel.fullName ?? "unknown",
        fontSize: 16,
        fontWeight:FontWeight.w600,
      ),
      subtitle: TextWidget(
        text: widget.allUserModel.bio ?? "No bio",
        color: Colors.grey[500],
      ),
      leading: CircleAvatar(
          radius: 24,
          backgroundImage: widget.allUserModel.image == null
              ? const AssetImage('assets/img/profile.png')
              : NetworkImage(widget.allUserModel.image!)),
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
            color: isSelected ? Colors.grey[200] : const Color(0xFF4DBF71),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: TextWidget(
              text: isSelected ? "Unfriends" : "Friend",
              color: isSelected ? const Color(0xFF4DBF71) : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
