import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thamra/core/widgets/custom_app_bar_profile.dart';
import 'package:thamra/features/get_categories/model.dart';
import 'package:thamra/features/get_catigory_product/model.dart';

import '../../core/widgets/main_product_item.dart';
import '../../features/get_catigory_product/bloc.dart';
import '../../features/get_catigory_product/events.dart';
import '../../features/get_catigory_product/states.dart';

class CategoryScreen extends StatefulWidget {


  const CategoryScreen({Key? key, })
      : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final bloc = KiwiContainer().resolve<GetCatigoryProductBloc>()
    ..add(GetCatigoryProductEvent(id: 5));

  _CategoryScreenState();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child: CustomAppBarProfile(title: "خضراوات"),
            preferredSize: Size(double.infinity, 70.h)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Theme.of(context).primaryColor.withOpacity(.13)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/search.png",
                      height: 18.w,
                      width: 18.w,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "ابحث عن ماتريد؟",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Color(0xffB9C9A8),
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.r),
                            color: Theme.of(context).primaryColor),
                        child: SvgPicture.asset(
                            "assets/icons/profile_icon/search_setting.svg"))
                  ],
                ),
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetCatigoryProductSuccessState) {
                    return GridView.builder(
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: double.minPositive,
                                childAspectRatio: 163 / 215),
                        itemBuilder: ((context, index) {
                          return MainProductItem(
                            favProductData: state.list[index],
                          );
                        }));
                  } else {
                    return Column(
                      children: List.generate(
                          4,
                          (index) => Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white10,
                                  child: Container(
                                    height: 97.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                  ),
                                ),
                              )),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
