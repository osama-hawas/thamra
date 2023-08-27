import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/design/main_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: MainTextField(
            text: 'ابحث عن ماتريد؟',
            prefixIcon: 'assets/icons/png/search.png',
            homeInput: true,
          ),
        ),
      ),
    );
  }
}
