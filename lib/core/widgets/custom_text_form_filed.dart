import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  bool isPassword;
  final String? Function(String?)? validator;
  final bool isSuffixIconShown;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  CustomTextFormField({
    super.key,
    required this.title,
    this.isPassword = false,
    this.isSuffixIconShown = false,
    this.keyboardType,
    required this.validator,
    required this.controller,
    required this.obscureText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.r)),
              borderSide: BorderSide(
            color: Color(0xffFFC700),
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffFFC700),
              ),
              borderRadius: BorderRadius.all(Radius.circular(18.r))),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          hintText: widget.title,
          hintStyle: TextStyle(color: Color(0xff757575)),
          filled: true,
          fillColor: Colors.grey[900],
        ));
  }
}
