import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thamra/core/utils/app_routes.dart';
import 'package:thamra/core/widgets/btn.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Btn(text: 'Suggestions page', onPressed: (){
          GoRouter.of(context).push(AppRoutes.suggestionPage);
        }),
      )

    );
  }
}
