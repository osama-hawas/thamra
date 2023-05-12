import 'package:flutter/material.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';

class SuggestionsScreen extends StatelessWidget {
  SuggestionsScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 50,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsetsDirectional.only(start: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Theme.of(context).primaryColor.withOpacity(.13)),
            child: Image.asset('assets/icons/Arrow - Right 2.png'),
          ),
          title: Text(
            'الأقتراحات والشكاوي',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
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
            SizedBox(
              height: 16,
            ),
            Btn(text: 'إرسال', onPressed: () {

            }),
          ],
        ),
      ),
    );
  }
}
