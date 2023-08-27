import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/search_screen.dart';
import 'package:thamra/core/logic/helper_methods.dart';
import 'package:thamra/features/home_slider/bloc.dart';
import 'package:thamra/screens/home_pages/home/widgets/categoru_item.dart';
import 'package:thamra/screens/home_pages/home/widgets/custom_app_bar.dart';
import 'package:thamra/screens/home_pages/home/widgets/product_item.dart';

import '../../../core/design/main_text_field.dart';
import '../../../features/get_categories/bloc.dart';

import '../../../features/get_product/bloc.dart';

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
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const CustomAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: MainTextField(
              text: 'ابحث عن ماتريد؟',
              prefixIcon: 'assets/icons/png/search.png',
              homeInput: true,
              onPress: () {
                navigateTo(context, route: const SearchScreen());
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                sliderBloc.add(HomeSliderEvent());
                getCategoriesBloc.add(GetCategoriesEvent());
                productIteBloc.add(GetProductEvent());
                return await Future.delayed(const Duration(milliseconds: 500));
              },
              color: Theme.of(context).primaryColor,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    BlocConsumer(
                      bloc: sliderBloc,
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is HomeSliderLoadingState ||
                            sliderBloc.data == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is HomeSliderSuccessState) {
                          return SizedBox(
                            height: 164.h,
                            child: Swiper(
                                itemCount: state.list.length,
                                autoplay: true,
                                itemBuilder: (context, index) => Image.network(
                                      state.list[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                pagination: SwiperPagination(
                                  builder: DotSwiperPaginationBuilder(
                                    activeColor: Theme.of(context).hintColor,
                                    space: 3,
                                    color: Theme.of(context)
                                        .hintColor
                                        .withOpacity(.2),
                                  ),
                                )),
                          );
                        } else {
                          return const Center(
                              child: Text("Failed to show Image"));
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 28.h, bottom: 8.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.only(start: 16.w),
                                child: Text(
                                  'الأقسام',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Spacer(),
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
                                return SizedBox(
                                  height: 135.h,
                                  child: ListView.builder(
                                    itemCount: state.list.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        CategoriesItem(
                                            categoryData: state.list[index]),
                                  ),
                                );
                              } else {
                                return const Text("Failed");
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 16.w),
                      child: Text(
                        'الأصناف',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const ProductItem(),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
