import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/design/main_button.dart';

class CartTextField extends StatelessWidget {
  const CartTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 14,
              color: Colors.grey.withOpacity(.16),
              blurStyle: BlurStyle.outer)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffB9C9A8).withOpacity(.13),
                labelText: "عندك كوبون ؟ ادخل رقم الكوبون",
                alignLabelWithHint: true,
                labelStyle: const TextStyle(
                  color: Color(0xffB9C9A8),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Color(0xffF3F3F3))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Color(0xffF3F3F3)),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: MainButton(text: "تطبيق", onPressed: () {}),
          )
        ],
      ),
    );
  }
}
