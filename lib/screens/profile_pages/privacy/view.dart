import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thamra/screens/profile_pages/privacy/cubit.dart';
import 'package:thamra/screens/profile_pages/privacy/states.dart';

import '../../../core/widgets/custom_app_bar_profile.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivacyCubit(),
      child: Builder(

          builder: (context) {
            PrivacyCubit cubit = BlocProvider.of(context);
            cubit.getPolicies();
            return SafeArea(
              child: Scaffold(
                  appBar:const  PreferredSize(
                      preferredSize: Size.fromHeight(70),
                      child: CustomAppBarProfile(title: 'سياسة الخصوصية')),
                  body: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                    if (state is PrivacyloadingState) {
                        return const  Center
                          (
                          child: CircularProgressIndicator(),
                        );
                    }
                    else if (state is PrivacysuccessState) {
                      return  ListView(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: Html(data: cubit.data),
                          )
                        ]
                        ,
                      );
                    }  else{
                      return const Text('Failed',style: TextStyle(fontSize: 50),);
                    }
                  },)

              ),
            );
          }
      ),
    );
  }
}


