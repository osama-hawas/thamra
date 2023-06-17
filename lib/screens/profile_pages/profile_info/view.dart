import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/utils/helper_methods.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';
import 'package:thamra/features/edit_profile/edit_profile_cubit.dart';
import 'package:thamra/features/get_cities/cities_event.dart';

import '../../../core/widgets/custom_app_bar_profile.dart';
import '../../../features/get_cities/get_cities_cubit.dart';

class ProfileInfoScreen extends StatefulWidget {
  ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final editProfileCubit = KiwiContainer().resolve<EditProfileCubit>();
  final getCitiesBloc = KiwiContainer().resolve<GetCitiesCubit>()
    ..add(GetCitiesEvent());

  final nameController = TextEditingController(text: CacheHelper.getName());

  final phoneController = TextEditingController(text: CacheHelper.getPhone());

  final cityController = TextEditingController(text: CacheHelper.getCityName());

  String cityId = CacheHelper.getCityId();

  File? selectedImage;

  bool isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 70.h),
            child: const CustomAppBarProfile(
              title: "البيانات الشخصية",
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 29.h,
              ),
              StatefulBuilder(builder: (context, setState) {
                return Center(
                  child: GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker.platform.pickImage(
                          source: ImageSource.camera, imageQuality: 30);
                      if (image != null) {
                        selectedImage = File(image.path);
                      }
                      setState(() {});
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: 90.h,
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Stack(children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(.32),
                            BlendMode.darken,
                          ),
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  height: 90.h,
                                  width: 90.h,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  CacheHelper.getImage(),
                                  height: 90.h,
                                  width: 90.h,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Center(
                          child: SvgPicture.asset(
                            "assets/icons/camera.svg",
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 3.h,
              ),
              BlocBuilder(
                bloc: editProfileCubit,
                builder: (context, state) => Column(
                  children: [
                    Text(CacheHelper.getName(),
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor)),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(CacheHelper.getPhone(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).hintColor),
                        textDirection: TextDirection.ltr),
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Input(
                text: "اسم المستخدم",
                controller: nameController,
                prefixIcon: "assets/icons/man.png",
              ),
              Input(
                  text: "رقم الجوال",
                  controller: phoneController,
                  prefixIcon: "assets/icons/phone.png",
                  type: InputType.phone),
              StatefulBuilder(builder: (context, setState) {
                return Input(
                  text: "المدينة",
                  prefixIcon: "assets/icons/city.png",
                  onPress: () async {
                    var result = await showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                        ),
                      ),
                      context: context,
                      builder: (context) => Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Select Your City :",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).hintColor),
                            ),
                            Expanded(
                              child:
                                  BlocBuilder<GetCitiesCubit, GetCitiesState>(
                                builder: (context, state) {
                                  if (state is GetCitiesLoadingState) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state is GetCitiesFailedState) {
                                    return Center(
                                      child: Text(
                                        "Sorry .Try again later",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).hintColor),
                                      ),
                                    );
                                  } else if (state is GetCitiesSuccessState) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                            state.list.length,
                                            (index) => GestureDetector(
                                                  onTap: () {
                                                    cityId =
                                                        state.list[index].id;
                                                    GoRouter.of(context).pop(
                                                        state.list[index].name);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.all(8.r),
                                                    padding:
                                                        EdgeInsets.all(16.r),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                        color: Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(.05)),
                                                    child: Text(
                                                      state.list[index].name,
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
                                                                  .hintColor),
                                                    ),
                                                  ),
                                                )),
                                      ),
                                    );
                                  } else {
                                    return const Text("wrong");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    if (result != null) {
                      cityController.text = result;
                    }
                    setState(() {});
                  },
                  controller: cityController,
                );
              }),
              Input(
                text: "كلمة المرور",
                prefixIcon: "assets/icons/pass.png",
                sufixIcon: SvgPicture.asset(
                  "assets/icons/line-arrow.svg",
                  fit: BoxFit.scaleDown,
                ),
                onPress: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 28.h),
          child: BlocConsumer(
            bloc: editProfileCubit,
            listener: (context, state) {
              if (state is EditProfileSuccessState) {
                showMSG(message: state.msg);
                CacheHelper.updateUserProfile(
                    name: nameController.text,
                    phone: phoneController.text,
                    cityName: cityController.text,
                    cityId: cityId);
                isUpdate = true;
              }
            },
            builder: (context, state) {
              return Btn(
                  isLoading: state is EditProfileLoadingState,
                  text: "تعديل البيانات",
                  onPressed: () {
                    // if (formkey.currentState!.validate()) {
                    //   print("click");
                    editProfileCubit.updateProfile(
                      image: selectedImage,
                      name: nameController.text,
                      cityId: cityId,
                      phone: phoneController.text,
                    );
                    // }
                  });
            },
          ),
        ),
      ),
    );
  }
}
