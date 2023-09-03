import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/design/main_product_item.dart';
import 'package:thamra/core/design/main_text_field.dart';
import 'package:thamra/core/design/main_text_style.dart';

import '../../features/search/bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final bloc = KiwiContainer().resolve<SearchBloc>();
  List? result;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: MainTextField(
                      text: 'ابحث عن ماتريد؟',
                      prefixIcon: 'assets/icons/png/right.png',
                      iconPressed: () {
                        Navigator.pop(context);
                      },
                      type: InputType.search,
                      filterSearch: () async {
                        result = await showBottomSheetFilter();
                        if (result != null) {
                          bloc.filter = result![0];
                          bloc.min = result![1];
                          bloc.max = result![2];
                          setState(() {
                            bloc.add(SearchEvent());
                          });
                        }
                      },
                      homeInput: true,
                      controller: bloc.keywordController,
                      onChanged: (searchChar) {
                        bloc.add(SearchEvent());
                      },
                    ),
                  ),
                  if (state is SearchSuccessState)
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: double.minPositive,
                              childAspectRatio: 163 / 250),
                      itemBuilder: (context, index) =>
                          MainProductItem(productData: state.list[index]),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showBottomSheetFilter() {
    bool isMinPrice = true;
    int start = 5;
    int end = 180;
    String filterBy = "asc";
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(38.r),
                topLeft: Radius.circular(38.r))),
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: MainTextStyle(text: "تصفية", fontSize: 17)),
                    const Divider(),
                    SizedBox(
                      height: 12.5.h,
                    ),
                    Text(
                      "السعر",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    RangeSlider(
                      values: RangeValues(start.toDouble(), end.toDouble()),
                      labels: RangeLabels(start.toString(), end.toString()),
                      onChanged: (value) {
                        setState(() {
                          start = value.start.toInt();
                          end = value.end.toInt();
                        });
                      },
                      min: 0,
                      max: 200,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 4.5.h,
                    ),
                    Text(
                      "الترتيب",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            isMinPrice = true;
                            filterBy = "asc";
                            setState(() {});
                          },
                          child: Container(
                            width: 23.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                                color: isMinPrice == true
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                border: isMinPrice
                                    ? null
                                    : Border.all(
                                        color: Theme.of(context).hintColor,
                                        width: 1.w),
                                borderRadius: BorderRadius.circular(6.r)),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        const MainTextStyle(
                            text: "من السعر الأقل للأعلي", fontSize: 15)
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            isMinPrice = false;
                            filterBy = "desc";
                            setState(() {});
                          },
                          child: Container(
                            width: 23.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                                color: isMinPrice == false
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                border: isMinPrice
                                    ? Border.all(
                                        color: Theme.of(context).hintColor,
                                        width: 1.w)
                                    : null,
                                borderRadius: BorderRadius.circular(6.r)),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        const MainTextStyle(
                            text: "من السعر الأعلي للأقل ", fontSize: 15)
                      ],
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    MainButton(
                        text: "تطبيق",
                        onPressed: () {
                          Navigator.pop(context, [filterBy, start, end]);
                        }),
                  ],
                ),
              ),
            ));
  }
}
