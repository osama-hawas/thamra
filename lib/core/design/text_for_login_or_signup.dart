import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextForLoginOrSignup extends StatelessWidget {
  final String text, signText;
  final void Function()? onTap;

  const TextForLoginOrSignup(
      {Key? key, required this.text, required this.signText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            signText,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
