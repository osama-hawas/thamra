import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/custom_app_bar_profile.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/features/add_address/states.dart';

import '../../../features/add_address/bloc.dart';
import '../../../features/add_address/events.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final bloc = KiwiContainer().resolve<AddAddressBloc>();
  late String lat, lng;
  Set<Marker> markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.0199494, 31.3917517),
    zoom: 14.4746,
  );
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: CustomAppBarProfile(title: "إضافة عنوان")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 410.h,
                child: GoogleMap(
                  markers: markers,
                  onTap: (argument) {
                    bloc.lat = argument.latitude.toString();
                    bloc.lng = argument.longitude.toString();
                    markers.add(Marker(
                        markerId: MarkerId("1"),
                        position:
                            LatLng(argument.latitude, argument.longitude)));
                    setState(() {});
                  },
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.r),
                margin: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          offset: Offset(0, 3),
                          blurStyle: BlurStyle.normal,
                          blurRadius: 20,
                          spreadRadius: .5)
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "نوع العنوان",
                      style: TextStyle(
                          fontSize: 15.sp, color: Theme.of(context).hintColor),
                    ),
                    Spacer(),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          isSelected = true;
                          bloc.tpye = "المنزل";
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.r),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          child: Text(
                            "المنزل",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: isSelected
                                    ? Colors.white
                                    : Color(0xff8B8B8B)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          isSelected = false;
                          bloc.tpye = "العمل";
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.r),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.green,
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          child: Text(
                            "العمل",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: isSelected
                                    ? Color(0xff8B8B8B)
                                    : Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              MainTextField(
                  text: "أدخل العنوان", controller: bloc.locationController),
              MainTextField(
                text: "أدخل رقم الجوال",
                controller: bloc.phoneController,
              ),
              MainTextField(
                text: "الوصف",
                controller: bloc.descController,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: 16.r, start: 16.w, end: 16.w, top: 4.h),
          child: BlocConsumer(
            bloc: bloc,
            listener: (context, state) {
              if (state is AddAddressSuccessState) {
                showMSG(message: state.msg);
                GoRouter.of(context).pop();
              }
              if (state is AddAddressFailedState) {
                showMSG(message: state.msg);
              }
            },
            builder: (context, state) {
              return MainButton(
                  text: "إضافة العنوان",
                  onPressed: () {
                    bloc.add(AddAddressEvent());
                  });
            },
          ),
        ),
      ),
    );
  }
}
