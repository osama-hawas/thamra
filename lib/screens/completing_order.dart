import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/core/design/main_button.dart';
import 'package:thamra/core/design/main_text_field.dart';
import 'package:thamra/core/design/main_text_style.dart';
import 'package:thamra/core/logic/helper_methods.dart';
import 'package:thamra/screens/home_pages/home/widgets/address_bottom_sheet.dart';
import 'package:thamra/screens/profile_pages/add_address.dart';

import '../core/logic/cache_helper.dart';
import '../features/comleting_order/bloc.dart';
import '../features/get_addresses/bloc.dart';
import '../features/show_cart/bloc.dart';
import 'home_pages/view.dart';

class CompletingOrderScreen extends StatefulWidget {
  const CompletingOrderScreen({Key? key, required this.cartModel})
      : super(key: key);
  final CartModel cartModel;

  @override
  State<CompletingOrderScreen> createState() => _CompletingOrderScreenState();
}

class _CompletingOrderScreenState extends State<CompletingOrderScreen> {
  final bloc = KiwiContainer().resolve<CompletingOrderBloc>();
  String? formattedDate;
  TimeOfDay? time;
  AddressData? addressData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarProfile(title: "إتمام الطلب"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 30.h,
          ),
          MainTextStyle(text: "الإسم : ${CacheHelper.getName()}", fontSize: 17),
          SizedBox(
            height: 10.h,
          ),
          MainTextStyle(
              text: "الجوال : ${CacheHelper.getPhone()}", fontSize: 17),
          SizedBox(
            height: 37.h,
          ),
          Row(
            children: [
              Text(
                "اختر عنوان التوصيل",
                style: TextStyle(
                    fontSize: 17.sp,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    fontWeight: FontWeight.w900),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  navigateTo(context, route: const AddAddressScreen());
                },
                child: Container(
                  height: 26.w,
                  width: 26.w,
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: Theme
                          .of(context)
                          .primaryColor
                          .withOpacity(.16)),
                  child: Image.asset(
                    "assets/icons/png/add.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          GestureDetector(
            onTap: () async {
              addressData = await showModelBottomSheet(context);
              if (addressData != null) {
                CacheHelper.saveLocation(
                    location: addressData!.location.toString());
              }

              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                border: Border.all(
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ),
              child: Row(
                children: [
                  MainTextStyle(
                      text:
                      "العنوان : ${(addressData != null ? addressData!.location
                          .toString() : CacheHelper.getLocation() ??
                          'شارع الملك فهد - جدة')}",
                      fontSize: 15),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            "تحديد وقت التوصيل",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 13.w,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await (showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2030)));

                    if (pickedDate != null) {
                      formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                    bloc.date = formattedDate!;
                    setState(() {

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: Theme
                            .of(context)
                            .hintColor
                            .withOpacity(.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              formattedDate == null
                                  ? "اختر اليوم والتاريخ"
                                  : formattedDate.toString(),
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Image.asset(
                          "assets/icons/png/day_cart.png",
                          height: 17.w,
                          width: 17.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    TimeOfDay? getTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (getTime != null) {
                      time = getTime;
                      bloc.time = time!;
                    }
                    setState(() {

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: Theme
                            .of(context)
                            .hintColor
                            .withOpacity(.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              time == null
                                  ? "اختر الوقت"
                                  : "${time!.hour}:${time!.minute}",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Image.asset(
                          "assets/icons/png/date_cart.png",
                          height: 17.w,
                          width: 17.w,
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            "ملاحظات وتعليمات",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 7.h,
          ),
          MainTextField(
            text: "",
            minLines: 5,
            controller: bloc.noteController,
          ),
          Text(
            "اختر طريقة الدفع",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 19.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50.h,
                  width: 104.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .primaryColor
                          .withOpacity(.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/png/kash.png",
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      const MainTextStyle(text: "كاش", fontSize: 18),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: 104.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .hintColor
                          .withOpacity(.5),
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/png/visa.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Container(
                  height: 50.h,
                  width: 104.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .hintColor
                          .withOpacity(.5),
                    ),
                  ),
                  child: Image.asset(
                    "assets/icons/png/mastrcard.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "اختر طريقة الدفع",
            style: TextStyle(
                fontSize: 17.sp,
                color: Theme
                    .of(context)
                    .primaryColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: EdgeInsets.all(9.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                color: const Color(0xffF3F8EE)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "إجمالي المنتجات",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme
                              .of(context)
                              .primaryColor),
                    ),
                    const Spacer(),
                    Text(
                        "${widget.cartModel.totalPriceBeforeDiscount
                            .toString()}ر.س",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme
                                .of(context)
                                .primaryColor)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Text(
                      "سعر التوصيل",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme
                              .of(context)
                              .primaryColor),
                    ),
                    const Spacer(),
                    Text("${widget.cartModel.deliveryCost.toString()}ر.س",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme
                                .of(context)
                                .primaryColor)),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Text(
                      "الخصم",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme
                              .of(context)
                              .primaryColor),
                    ),
                    const Spacer(),
                    Text("- ${widget.cartModel.totalDiscount.toString()}ر.س",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme
                                .of(context)
                                .primaryColor)),
                  ],
                ),
                const Divider(
                  thickness: .5,
                ),
                SizedBox(
                  height: 8.5.h,
                ),
                Row(
                  children: [
                    Text(
                      "المجموع",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme
                              .of(context)
                              .primaryColor),
                    ),
                    const Spacer(),
                    Text("${widget.cartModel.totalPriceWithVat.toString()}ر.س",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme
                                .of(context)
                                .primaryColor)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          BlocConsumer(
            bloc: bloc,
            listener: (context, state) {
              if (state is CompletingOrderSuccessState) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavView(),
                    ));
              }
              if (state is CompletingOrderFailedState) {
                showMSG(message: state.msg);
              }
            },
            builder: (context, state) {
              return MainButton(
                  text: "إنهاء الطلب",
                  isLoading: state is CompletingOrderLoadingState,
                  onPressed: () {
                    if (formattedDate != null && time
                        .toString()
                        .isNotEmpty) {
                      bloc.addressId =
                      addressData != null ? addressData!.id.toString():CacheHelper.getLocationId();
                      bloc.add(CompletingOrderEvent());
                    } else {
                      showMSG(message: "الوقت والتاريخ مطلوبين");
                    }
                  });
            },
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
