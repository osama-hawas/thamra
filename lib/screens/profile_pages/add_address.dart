import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';

import 'package:thamra/core/design/custom_app_bar_profile.dart';

import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../features/add_address/bloc.dart';
import '../../features/get_addresses/bloc.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key, this.addressData}) : super(key: key);
  final AddressData? addressData;

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final bloc = KiwiContainer().resolve<AddAddressBloc>();
  late String lat, lng;
  Set<Marker> markers = {};
  late bool isSelected;
  late CameraPosition _position;
  late AddressData addressData;

  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    addressData = widget.addressData!;
    _position = CameraPosition(
      target: addressData != null
          ? LatLng(addressData.lat, addressData.lng)
          :const LatLng(31, 31),
      zoom: 14.4746,
    );

    isSelected = addressData.type == "work" ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  const CustomAppBarProfile(title: "إضافة عنوان"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 410.h,
                child: GoogleMap(
                  zoomControlsEnabled: true,
                  markers: markers,
                  onTap: (argument) {

                    
                    // bloc.lat = addressData == null
                    //     ? argument.latitude.toString()
                    //     : addressData!.lat.toString();
                    // bloc.lng = addressData == null
                    //     ? argument.longitude.toString()
                    //     : addressData!.lng.toString();
                    markers.add(Marker(
                        markerId: const MarkerId("1"),
                        position:
                            LatLng(argument.latitude, argument.longitude)));
                    setState(()
                    {

                      bloc.lat = argument.latitude;
                      bloc.lng = argument.longitude;

                    });
                  },
                  mapType: MapType.normal,
                  initialCameraPosition: _position,
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
                          offset: const Offset(0, 3),
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
                    const Spacer(),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          isSelected = true;
                          bloc.tpye = addressData == null
                              ? "المنزل"
                              : addressData!.type;
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
                                    : const Color(0xff8B8B8B)),
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
                          bloc.tpye =
                              addressData == null ? "العمل" : addressData!.type;
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
                                    ? const Color(0xff8B8B8B)
                                    : Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              MainTextField(
                  text: addressData == null
                      ? "أدخل العنوان"
                      : addressData!.location,
                  controller: bloc.locationController),
              MainTextField(
                text: addressData == null
                    ? "أدخل رقم الجوال"
                    : addressData!.phone,
                controller: bloc.phoneController,
              ),
              MainTextField(
                text: addressData == null ? "الوصف" : addressData!.description,
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
                GoRouter.of(context).pop();
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
