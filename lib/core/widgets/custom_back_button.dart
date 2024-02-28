

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 class CustomBackButton extends StatefulWidget {
   final void Function()? onPressed ;
   const CustomBackButton({
     super.key,
     required this.onPressed,
   });

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        width: 45.w,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffFFC700)),
            borderRadius: BorderRadius.circular(8.r)),
        child: IconButton(
            onPressed: widget.onPressed,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xffFFC700),
              size: 16.sp,
            )));
  }
}
