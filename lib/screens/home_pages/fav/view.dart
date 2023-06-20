import 'package:flutter/material.dart';
import 'package:thamra/core/data/local/cache_helper.dart';
import 'package:thamra/core/widgets/btn.dart';
import 'package:thamra/core/widgets/input.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  late List<String> titleList = [];

  late String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: MainTextField(
                text: 'add text',
                prefixIcon: 'assets/icons/search.png',
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                child: MainButton(
                    text: 'Add',
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                      if (title != null) {
                        CacheHelper.addTitle(title);
                      } else {
                        print('error');
                      }
                      setState(() {});
                    }),
              ),

                Column(
                  children: List.generate(1 , (index) => NotivayItem()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotivayItem extends StatefulWidget {
  const NotivayItem({Key? key}) : super(key: key);

  @override
  State<NotivayItem> createState() => _NotivayItemState();
}

class _NotivayItemState extends State<NotivayItem> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin:
          EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16, top: 32),
      child: show
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CacheHelper.showTitle(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 8),
                        child: MainButton(
                            text: 'delete',
                            onPressed: () {
                              CacheHelper.removeTitle();
                              show = false;
                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                )
              ],
            )
          : null,
    );
  }
}
