import 'package:exercises_1/pass_arguments.dart';
import 'package:exercises_1/widget/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInput extends StatefulWidget {
  @override
  FormInputState createState() => FormInputState();
}

class FormInputState extends State<FormInput> {
  //input controller
  TextEditingController? nameInputController;
  TextEditingController? ageInputController;
  TextEditingController? addressInputController;

  //font style
  TextStyle fontsPoppins(isHint) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: (isHint) ? Colors.green : Colors.grey,
      );

  TextStyle secondaryFontInter() => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  OutlineInputBorder borderInputStyle(isInput) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: (isInput) ? Colors.blue : Colors.black,
          width: 2.0.w,
        ),
      );

  @override
  void initState() {
    super.initState();

    initConstructor();
  }

  initConstructor() {
    nameInputController = TextEditingController();
    ageInputController = TextEditingController();
    addressInputController = TextEditingController();
  }

  @override
  Widget build(context) {
    btnSubmit() => Padding(
          padding: EdgeInsets.all(10.w),
          child: Card(
            elevation: 5,
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: InkWell(
              onTap: () => validateForm(),
              borderRadius: BorderRadius.circular(10.r),
              splashColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text("Hasil",
                    style: secondaryFontInter(), textAlign: TextAlign.center),
              ),
            ),
          ),
        );

    fieldInput(status) => TextFormField(
          keyboardType: (status == "fullname" || status == "")
              ? TextInputType.text
              : TextInputType.number,
          textInputAction: (status == "fullname")
              ? TextInputAction.next
              : TextInputAction.done,
          maxLength: (status == "age") ? 2 : null,
          controller: (status == "fullname")
              ? nameInputController
              : (status == "age")
                  ? ageInputController
                  : addressInputController,
          decoration: InputDecoration(
            label: Text(
              (status == "fullname")
                  ? "Nama Lengkap"
                  : (status == "age")
                      ? "Usia"
                      : "Alamat",
              style: fontsPoppins(false),
            ),
            focusedBorder: borderInputStyle(true),
            enabledBorder: borderInputStyle(false),
            filled: true,
            fillColor: Colors.white,
          ),
          style: fontsPoppins(true),
        );

    contentBody() => Padding(
          padding: EdgeInsets.all(20.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                fieldInput("fullname"),
                SizedBox(height: 8.h),
                fieldInput("age"),
                SizedBox(height: 8.h),
                fieldInput(""),
              ],
            ),
          ),
        );

    body() => Stack(
          children: [
            Background(),
            contentBody(),
          ],
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.red),
      child: SafeArea(
        child: Scaffold(
          body: body(),
          bottomNavigationBar: btnSubmit(),
          backgroundColor: const Color(0x80FFFFFF),
        ),
      ),
    );
  }

  snackbarMessage(message) =>
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);

  validateForm() async {
    if (nameInputController!.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbarMessage("Nama lengkap tidak tersedia."));
    } else if (ageInputController!.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbarMessage("Usia tidak tersedia."));
    } else if (addressInputController!.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbarMessage("Alamat tidak tersedia."));
    } else {
      await moveToResult();
    }
  }

  moveToResult() => Navigator.pushNamed(
        context,
        '/result_page2',
        arguments: GeneralPassData(
            nama: nameInputController!.text,
            age: ageInputController!.text,
            address: addressInputController!.text),
      ).then(
        (_) {
          nameInputController!.clear();
          ageInputController!.clear();
          addressInputController!.clear();
        },
      );
}
