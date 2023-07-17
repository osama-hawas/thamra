import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';

import '../../core/design/main_text_style.dart';
import '../../core/logic/app_routes.dart';

import '../../features/delete_address/bloc.dart';

import '../../features/get_addresses/bloc.dart';
import '../shimmers/shimmer_listview.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  final bloc = KiwiContainer().resolve<GetAddressesBloc>()
    ..add(GetAddressesEvent());
  final deleteAddressBloc = KiwiContainer().resolve<DeleteAddressesBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarProfile(title: "العناوين"),
        body: SingleChildScrollView(
          child: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetAddressesSuccessState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      bloc.list.length,
                      (index) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 2.h),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  MainTextStyle(text: state.list[index].type),
                                  Text.rich(TextSpan(
                                    children: [
                                      TextSpan(
                                          text:
                                              "العنوان : ${state.list[index].location}\n"),
                                      TextSpan(
                                          text:
                                              "الوصف:${state.list[index].description}\n",
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor)),
                                      TextSpan(
                                          text:
                                              "رقم الجوال : ${state.list[index].phone}",
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor))
                                    ],
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 14.sp),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 9.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlocBuilder(
                                      bloc: deleteAddressBloc,
                                      builder: (context, state) {
                                        return GestureDetector(
                                          onTap: () {
                                            deleteAddressBloc.id =
                                                bloc.list[index].id;
                                            deleteAddressBloc
                                                .add(DeleteAddressesEvent());
                                            bloc.list.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(6.r),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7.r),
                                              color: const Color(0xffFFD4D4),
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
                                      onTap: () {},
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
                  return Column(
                    children:
                        List.generate(4, (index) => const ShimmerListView()),
                  );
                }
              }),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.r),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.addAddress);
            },
            child: DottedBorder(
              strokeWidth: 1,
              borderType: BorderType.RRect,
              color: Theme.of(context).primaryColor,
              radius: Radius.circular(15.r),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  height: 55.h,
                  color: const Color(0xffF9FCF5),
                  child: const MainTextStyle(text: "إضافة عنوان"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
