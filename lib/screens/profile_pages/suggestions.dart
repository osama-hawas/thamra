import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../core/design/custom_app_bar_profile.dart';
import '../../core/design/main_button.dart';
import '../../core/design/main_text_field.dart';
import '../../features/suggestions/bloc.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final bloc = KiwiContainer().resolve<CreateContactBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        // key: formkey,
        child: Scaffold(
          appBar:const CustomAppBarProfile(title: 'الأقتراحات والشكاوي'),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              const SizedBox(
                height: 32,
              ),
              MainTextField(text: 'الإسم', controller: bloc.nameController),
              MainTextField(
                text: 'رقم الموبايل',
                type: InputType.phone,
                controller: bloc.phoneController,
              ),
              MainTextField(
                text: 'عنوان الموضوع',
                controller: bloc.titleController,
              ),
              MainTextField(
                text: 'الموضوع',
                minLines: 4,
                controller: bloc.contentController,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  return MainButton(
                      isLoading: state is CreateContactLoadingState,
                      text: 'إرسال',
                      onPressed: () async {
                        bloc.add(MakeContactEvent());
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
