import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/logic/cache_helper.dart';

import 'package:thamra/features/edit_profile/bloc.dart';
import 'package:thamra/screens/authentication/edit_pass.dart';

import '../../core/design/custom_app_bar_profile.dart';

import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../features/get_cities/bloc.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final editProfileBloc = KiwiContainer().resolve<EditProfileBloc>();
  final getCitiesBloc = KiwiContainer().resolve<GetCitiesBloc>()
    ..add(GetCitiesEvent());

  bool isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: const CustomAppBarProfile(
          title: "البيانات الشخصية",
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      final image = await ImagePicker.platform.getImageFromSource(
                          source: ImageSource.camera );
                      if (image != null) {
                        editProfileBloc.selectedImage = File(image.path);
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
                          child: editProfileBloc.selectedImage != null
                              ? Image.file(
                                  editProfileBloc.selectedImage!,
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
                            "assets/icons/svg/camera.svg",
                            color: Colors.white,
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
                bloc: editProfileBloc,
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
              MainTextField(
                text: "اسم المستخدم",
                controller: editProfileBloc.nameController,
                prefixIcon: "assets/icons/png/man.png",
                homeInput: true,
              ),
              MainTextField(
                  text: "رقم الجوال",
                  controller: editProfileBloc.phoneController,
                  prefixIcon: "assets/icons/png/phone.png",
                  homeInput: true,
                  type: InputType.phone),
              StatefulBuilder(builder: (context, setState) {
                return MainTextField(
                  text: "المدينة",
                  homeInput: true,
                  prefixIcon: "assets/icons/png/city.png",
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
                              child: BlocBuilder(
                                bloc: getCitiesBloc,
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
                                                    editProfileBloc.cityId =
                                                        state.list[index].id;
                                                    Navigator.pop(context,
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
                                                        color: state.list[index]
                                                                    .name ==
                                                                editProfileBloc
                                                                    .cityController
                                                                    .text
                                                            ? Theme.of(context)
                                                                .primaryColor
                                                                .withOpacity(.5)
                                                            : Theme.of(context)
                                                                .primaryColor
                                                                .withOpacity(
                                                                    .05)),
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
                      editProfileBloc.cityController.text = result;
                    }
                    setState(() {});
                  },
                  controller: editProfileBloc.cityController,
                );
              }),
              MainTextField(
                text: "كلمة المرور",
                homeInput: true,
                prefixIcon: "assets/icons/png/pass.png",
                type: InputType.editPass,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditPassScreen(),
                      ));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 28.h),
          child: BlocConsumer(
            bloc: editProfileBloc,
            listener: (context, state) {
              if (state is EditProfileSuccessState) {
                CacheHelper.updateUserProfile(
                    name: editProfileBloc.nameController.text,
                    phone: editProfileBloc.phoneController.text,
                    cityName: editProfileBloc.cityController.text,
                    cityId: editProfileBloc.cityId);
                isUpdate = true;
              }
            },
            builder: (context, state) {
              return MainButton(
                  isLoading: state is EditProfileLoadingState,
                  text: "تعديل البيانات",
                  onPressed: () {
                    // if (formkey.currentState!.validate()) {
                    //   print("click");
                    editProfileBloc.add(EditProfileEvent());
                    // }
                  });
            },
          ),
        ),
      ),
    );
  }
}
