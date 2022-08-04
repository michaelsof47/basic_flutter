import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Background extends StatelessWidget {
  @override
  Widget build(context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Image.asset('assets/images/data.jpeg', fit: BoxFit.cover),
    );
  }
}
