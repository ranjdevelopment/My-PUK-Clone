import 'package:flutter/material.dart';

AppBar appBarWidget(
  BuildContext context, {
  final String? title,
  final bool? centerTitle,
  final Widget? actions,
  final Widget? leading,
  final Color? bgColor,
  final Color? titleColor,
  final FontWeight? fontWeight,
  final double? fontSize,
}) =>
    AppBar(
      shadowColor:        Colors.black,
      
      centerTitle: centerTitle,
      backgroundColor: bgColor ?? Colors.grey[200],
      toolbarHeight: 100,
      title: Text(title!,
          style: TextStyle(
            color: titleColor ?? const Color(0xFF4DBF71),
            fontSize: fontSize ?? 30.0,
            fontWeight: fontWeight ?? FontWeight.w700,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: actions,
        ),
      ],
      leading: leading,
    );
