import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BtnType { elvated, outLine, outLineDisable, cansle, reject }

class MainButton extends StatelessWidget {
  final BtnType type;
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  MainButton({
    Key? key,
    this.type = BtnType.elvated,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 30.w,
        width: 30.w,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CircularProgressIndicator(),
        ),
      );


    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: type == BtnType.outLine || type == BtnType.outLineDisable
            ? OutlinedButton(
          onPressed: type == BtnType.outLineDisable
              ? null
              : () {
            onPressed();
          },
          child: Text(text),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: type == BtnType.outLineDisable
                    ? Color(0xffD8D8D8)
                    : Color(0xff4C8613)),
            alignment: Alignment.center,
            foregroundColor: Color(0xff4C8613),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0,
            padding:
            EdgeInsets.symmetric(vertical: 14.h, horizontal: 27.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        )
            : ElevatedButton(
          onPressed: () {
            FocusManager.instance.primaryFocus!.unfocus();
            onPressed();
          },
          child: Text(text),
          style: ElevatedButton.styleFrom(
            foregroundColor: type == BtnType.cansle ? Colors.red : null,
            backgroundColor:
            type == BtnType.cansle ? Color(0xffFFE1E1) : null,
            alignment: Alignment.center,
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            elevation: 0,
            minimumSize: Size(double.infinity, 60.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        ),
      );
    }
  }
}
