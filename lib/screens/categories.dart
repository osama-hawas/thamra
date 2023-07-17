import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/screens/shimmers/shimmer_grid.dart';

import '../core/design/main_product_item.dart';
import '../features/get_categories/bloc.dart';
import '../features/get_catigory_product/bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    Key? key,
    required this.categoryData,
  }) : super(key: key);
  final CategoryData categoryData;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final bloc = KiwiContainer().resolve<GetCatigoryProductBloc>();


  @override
  void initState() {
    super.initState();

    bloc.add(GetCatigoryProductEvent(id: widget.categoryData.id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarProfile(title: widget.categoryData.name),
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
                      "assets/icons/png/search.png",
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
                          color: const Color(0xffB9C9A8),
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.r),
                            color: Theme.of(context).primaryColor),
                        child: SvgPicture.asset(
                            "assets/icons/svg/search_setting.svg"))
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
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: double.minPositive,
                                  childAspectRatio: 163 / 215),
                          itemBuilder: ((context, index) {
                            return MainProductItem(
                              productData: state.list[index],
                            );
                          }));
                    } else {
                      return GridView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: double.minPositive,
                                  childAspectRatio: 163 / 215),
                          itemBuilder: ((context, index) {
                            return const ShimmerGrid();
                          }));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
