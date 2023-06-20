import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';

import '../../../core/utils/helper_methods.dart';
import '../../../core/widgets/custom_app_bar_profile.dart';
import '../../../features/suggestions/bloc.dart';
import '../../../features/suggestions/events.dart';
import '../../../features/suggestions/states.dart';

class SuggestionsScreen extends StatefulWidget {
  SuggestionsScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final bloc = KiwiContainer().resolve<SuggestionBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        // key: formkey,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: CustomAppBarProfile(title: 'الأقتراحات والشكاوي')),
          body: ListView(
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
              BlocConsumer(
                bloc: bloc,
                listener: (context, state) {
                  if (state is SuggestionSuccessState) {
                    showMSG(message: state.msg);
                  }
                  if (state is SuggestionFailedState) {
                    showMSG(message: state.msg);
                  }
                },
                builder: (context, state) {
                  return MainButton(
                      isLoading: state is SuggestionLoadingState,
                      text: 'إرسال',
                      onPressed: () async {
                        bloc.add(MakeSuggestionEvent());
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
