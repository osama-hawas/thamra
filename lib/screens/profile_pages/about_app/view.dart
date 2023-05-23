import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thamra/screens/profile_pages/about_app/states.dart';

import '../../../core/widgets/custom_app_bar_profile.dart';
import 'cubit.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutAppCubit(),
      child: Builder(builder: (context) {
        AboutAppCubit cubit = BlocProvider.of(context);
        cubit.getPolicies();
        return SafeArea(
          child: Scaffold(
              appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(70),
                  child: CustomAppBarProfile(title: 'عن التطبيق')),
              body: BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is AboutApploadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AboutAppsuccessState) {
                    return ListView(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 160,
                          width: 160,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13),
                          child: Html(
                            data: cubit.data,
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Text(
                      'Failed',
                      style: TextStyle(fontSize: 50),
                    );
                  }
                },
              )),
        );
      }),
    );
  }
}
