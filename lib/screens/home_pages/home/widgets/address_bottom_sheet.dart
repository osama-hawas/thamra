import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/screens/profile_pages/add_address.dart';
import 'package:thamra/screens/shimmers/shimmer_listview.dart';

import '../../../../core/design/main_text_style.dart';
import '../../../../features/delete_address/bloc.dart';
import '../../../../features/get_addresses/bloc.dart';

Future<dynamic> showModelBottomSheet(BuildContext context) async {
  final bloc = KiwiContainer().resolve<GetAddressesBloc>()
    ..add(GetAddressesEvent());
  final deleteAddressBloc = KiwiContainer().resolve<DeleteAddressesBloc>();
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(38.r), topLeft: Radius.circular(38.r))),
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(38.r),
            topLeft: Radius.circular(38.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 14.h,
            ),
            const MainTextStyle(text: "العناوين",fontSize: 20),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is GetAddressesSuccessState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            bloc.list.length,
                            (index) => GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context, state.list[index]);

                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 20.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 2.h),
                                // height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          MainTextStyle(
                                              text: state.list[index].type,fontSize: 16),
                                          Text.rich(TextSpan(
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "العنوان : ${state.list[index].location}\n"),
                                              TextSpan(
                                                  text:
                                                      "الوصف:${state.list[index].description}\n",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .hintColor)),
                                              TextSpan(
                                                  text:
                                                      "رقم الجوال : ${state.list[index].phone}",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .hintColor))
                                            ],
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 14.sp),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 9.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BlocConsumer(
                                            bloc: deleteAddressBloc,
                                            listener: (context, state) {
                                              if (state
                                                  is DeleteAddressesSuccessState) {
                                                bloc.list.removeAt(index);
                                                setState(() {});
                                              }
                                            },
                                            builder: (context, state) {
                                              return GestureDetector(
                                                onTap: () {
                                                  deleteAddressBloc.id =
                                                      bloc.list[index].id;
                                                  deleteAddressBloc.add(
                                                      DeleteAddressesEvent());
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(6.r),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7.r),
                                                    color:
                                                        const Color(0xffFFD4D4),
                                                  ),
                                                  child: SvgPicture.asset(
                                                    "assets/icons/svg/delete.svg",
                                                    height: 13.5.w,
                                                    width: 13.5.w,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddAddressScreen(
                                                            addressData: state
                                                                .list[index]),
                                                  ));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(6.r),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7.r),
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(.13),
                                              ),
                                              child: SvgPicture.asset(
                                                "assets/icons/svg/edit.svg",
                                                height: 13.5.w,
                                                width: 13.5.w,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const ShimmerListView();
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>const AddAddressScreen(),
                    ));
              },
              child: DottedBorder(
                strokeWidth: 1,
                borderType: BorderType.RRect,
                color: Theme.of(context).primaryColor,
                radius: Radius.circular(15.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 80.w),
                    color: Colors.white,
                    child: const MainTextStyle(text: "إضافة عنوان جديد",fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    ),
  );
}
