import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';

import 'package:thamra/core/design/custom_app_bar_profile.dart';

import 'package:thamra/features/suggestions/bloc.dart';

import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../features/contact/bloc.dart';

class ConnectUsScreen extends StatefulWidget {
  const ConnectUsScreen({Key? key}) : super(key: key);

  @override
  State<ConnectUsScreen> createState() => _ConnectUsScreenState();
}

class _ConnectUsScreenState extends State<ConnectUsScreen> {
  final contactBloc = KiwiContainer().resolve<GetContactBloc>()
    ..add(GetContactEvent());
  final createContactBloc = KiwiContainer().resolve<CreateContactBloc>();

  late String lat, lng;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(73.h),
            child: const CustomAppBarProfile(title: "تواصل معنا")),
        body: BlocBuilder(
          bloc: contactBloc,
          builder: (context, state) {
            if (state is GetContactSuccessState) {
              return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.only(bottom: 47.h),
                          alignment: Alignment.topCenter,
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.r),
                            color: Colors.grey,
                          ),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                state.data.lat,
                                state.data.lng,
                              ),
                              zoom: 14.4746,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                        ),
                        Container(
                            //color: Colors.white,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Container(
                              padding: EdgeInsets.all(15.r),
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.1),
                                      offset: const Offset(0, 3),
                                      blurStyle: BlurStyle.normal,
                                      blurRadius: 20,
                                      spreadRadius: 2,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/contact_location.svg",
                                        height: 17.w,
                                        width: 17.w,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          state.data.location,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/contact_phone.svg",
                                        height: 17.w,
                                        width: 17.w,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          state.data.phone == ""
                                              ? "01000555000"
                                              : state.data.phone,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/contact_email.svg",
                                        height: 17.w,
                                        width: 17.w,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        state.data.email,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ]),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: Text(
                      "أو يمكنك إرسال رسالة ",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 32.h,
                    ),
                    Column(
                      children: [
                        MainTextField(
                            text: 'الإسم',
                            controller: createContactBloc.nameController),
                        MainTextField(
                          text: 'رقم الموبايل',
                          type: InputType.phone,
                          controller: createContactBloc.phoneController,
                        ),
                        MainTextField(
                          text: 'عنوان الموضوع',
                          controller: createContactBloc.titleController,
                        ),
                        MainTextField(
                          text: 'الموضوع',
                          minLines: 4,
                          controller: createContactBloc.contentController,
                        ),
                        BlocBuilder(
                          bloc: createContactBloc,

                          builder: (context, state) {
                            return MainButton(
                                isLoading: state is CreateContactLoadingState,
                                text: 'إرسال',
                                onPressed: () async {
                                  createContactBloc.add(MakeContactEvent());
                                });
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    )
                  ]);
            } else {
              return Center(
                child: SizedBox(
                  height: 30.w,
                  child: const CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
