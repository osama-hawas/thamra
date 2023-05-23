import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: Container(

        margin: const EdgeInsetsDirectional.only(start: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Theme.of(context).primaryColor.withOpacity(.13)),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/icons/Arrow - Right 2.png'),
          ),
          onTap: () {GoRouter.of(context).pop();},

        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
