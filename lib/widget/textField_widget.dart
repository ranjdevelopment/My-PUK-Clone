import 'package:flutter/material.dart';
typedef OnChangedFunction = String? Function(String?)?;
class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.iconObscureText,
    this.onPressed,
    required this.controller,
    this.onChanged,
  });
  final String hintText;
  final TextInputType textInputType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? iconObscureText;
  final VoidCallback? onPressed;
  final OnChangedFunction? onChanged;
  final TextEditingController controller;
  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.iconObscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: widget.onPressed, icon: Icon(widget.suffixIcon)),
        suffixIconColor: Colors.grey,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.grey,
        ),
        hintStyle: TextStyle(color: Colors.grey),
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
    );
  }
}
