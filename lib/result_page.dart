import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  TextStyle fontsPoppins(isValue) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: (isValue) ? FontWeight.w500 : FontWeight.w300,
        color: Colors.black,
      );

  @override
  Widget build(context) {
    btnSubmit() => Padding(
          padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 10.h),
          child: Card(
            elevation: 5,
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(10.r),
              splashColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text("Kembali",
                    style: fontsPoppins(false), textAlign: TextAlign.center),
              ),
            ),
          ),
        );

    contentCard() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(text: "Halo, Namaku ", style: fontsPoppins(false)),
                TextSpan(text: "Michael Fernando ", style: fontsPoppins(true)),
              ]),
            ),
            SizedBox(height: 8.h),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: "Usiaku ", style: fontsPoppins(false)),
                TextSpan(text: "25 Tahun", style: fontsPoppins(true)),
              ]),
            ),
            SizedBox(height: 8.h),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Tempat Tinggalku di ", style: fontsPoppins(false)),
                TextSpan(
                    text: "Kapas Gading Regency No. 18",
                    style: fontsPoppins(true)),
              ]),
            ),
          ],
        );

    itemCard() => SizedBox(
          height: 172.h,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                color: Colors.amber,
                width: 2.0.w,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              child: contentCard(),
            ),
          ),
        );

    body() => Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: itemCard(),
          ),
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.blue),
      child: SafeArea(
        child: Scaffold(
          body: body(),
          bottomNavigationBar: btnSubmit(),
        ),
      ),
    );
  }
}
