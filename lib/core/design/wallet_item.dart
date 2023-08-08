import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/design/main_text_style.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.016),
            offset: const Offset(0, 6),
            blurStyle: BlurStyle.inner,
            blurRadius: 17,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/icons/png/wallet_icon.png"),
              SizedBox(
                width: 9.w,
              ),
              MainTextStyle(text: "شحن المحفظة"),
              Spacer(),
              Text(
                "22/5/2022",
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 50.w),
            child: const MainTextStyle(text: "255 ر.س"),
          )
        ],
      ),
    );
  }
}
