import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';

import '../../../core/utils/helper_methods.dart';
import '../../../core/widgets/custom_app_bar_profile.dart';

class SuggestionsScreen extends StatefulWidget {
  SuggestionsScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final titleController = TextEditingController();

  final contentController = TextEditingController();

  bool isSend = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formkey,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(70),
              child:  CustomAppBarProfile(title: 'الأقتراحات والشكاوي')),
          body: ListView(
            children: [
              const SizedBox(
                height: 32,
              ),
              Input(text: 'الإسم', controller: nameController),
              Input(
                text: 'رقم الموبايل',
                type: InputType.phone,
                controller: phoneController,
              ),
              Input(
                text: 'عنوان الموضوع',
                controller: titleController,
              ),
              Input(
                text: 'الموضوع',
                minLines: 4,
                controller: contentController,
              ),
              const SizedBox(
                height: 16,
              ),
              isSend
                  ?const Center(child: CircularProgressIndicator())
                  : Btn(
                      text: 'إرسال',
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          isSend = true;
                        }

                        setState(() {});

                        Response response = await Dio().post(
                            'https://thimar.amr.aait-d.com/api/contact',
                            data: {
                              "fullname": nameController.text,
                              "phone": phoneController.text,
                              "title": titleController.text,
                              "content": contentController.text,
                            });
                        nameController.clear();
                        phoneController.clear();
                        titleController.clear();
                        contentController.clear();

                         ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response.data["message"]),
                          ),
                        );
                        isSend=false;
                        setState(() {

                        });
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
