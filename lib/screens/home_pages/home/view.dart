import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/features/home_slider/bloc.dart';
import 'package:thamra/screens/home_pages/home/widgets/categoru_item.dart';
import 'package:thamra/screens/home_pages/home/widgets/custom_app_bar.dart';
import 'package:thamra/screens/home_pages/home/widgets/product_item.dart';

import '../../../core/widgets/main_text_field.dart';
import '../../../features/get_categories/bloc.dart';
import '../../../features/get_categories/events.dart';
import '../../../features/get_categories/states.dart';
import '../../../features/get_product/bloc.dart';
import '../../../features/get_product/events.dart';
import '../../../features/home_slider/events.dart';
import '../../../features/home_slider/states.dart';

// slider circle avatare

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sliderBloc = KiwiContainer().resolve<HomeSliderBloc>()
    ..add(HomeSliderEvent());

  final getCategoriesBloc = KiwiContainer().resolve<CategoriesBloc>()
    ..add(GetCategoriesEvent());
  final productIteBloc = KiwiContainer().resolve<GetProductsBloc>()
    ..add(GetProductEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          MainTextField(
            text: 'ابحث عن ماتريد؟',
            prefixIcon: 'assets/icons/search.png',
            onChanged: (value) {},
            homeInput: true,
          ),
          BlocConsumer(
            bloc: sliderBloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HomeSliderLoadingState || sliderBloc.data == null) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HomeSliderSuccessState) {
                return CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 170.h,
                    viewportFraction: 1,
                  ),
                  items: List.generate(
                      state.list.length,
                      (index) => Image.network(
                            state.list[index].image,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          )),
                );
              } else {
                return const Center(child: Text("Failed to show Image"));
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 28.h, bottom: 8.h),
            child: Container(
              // color: Colors.amber,
              // height: 140,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 16.w),
                        child: Text(
                          'الأقسام',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 20.w),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'عرض الكل',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  BlocConsumer(
                    bloc: getCategoriesBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CategoriesLoadingState ||
                          getCategoriesBloc.data == null) {
                        return SizedBox(
                          height: 135.h,
                        );
                      }
                      if (state is CategoriesSuccessState) {
                        return Container(
                          height: 135.h,
                          child: ListView.builder(
                            itemCount: state.list.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                CategoriesItem(categoryData: state.list[index]),
                          ),
                        );
                      } else {
                        return Text("Failed");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Text(
              'الأصناف',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
          ),
          ProductItem(),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    ));
  }
}
