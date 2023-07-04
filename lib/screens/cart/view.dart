import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thamra/core/widgets/custom_app_bar_profile.dart';
import 'package:thamra/screens/cart/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child: CustomAppBarProfile(title: "السلة"),
            preferredSize: Size(double.infinity, 70.h)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             ...List.generate(5, (index) => CartItem()),




            ],
          ),
        ),
      ),
    );
  }
}
