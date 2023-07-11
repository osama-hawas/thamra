import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thamra/core/design/custom_app_bar_profile.dart';
import 'package:thamra/features/faqs/bloc.dart';


class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final bloc = KiwiContainer().resolve<FAQsBloc>()..add(GetFAQsEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 70.h),
          child: const CustomAppBarProfile(title: "أسئلة متكررة")),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is FAQssuccessState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                // final question = questions[index]['question'];
                // final answer = questions[index]['answer'];
                return Container(
                  margin: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.r),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 14,
                            color: Colors.grey.withOpacity(.16),
                            blurStyle: BlurStyle.outer)
                      ]),
                  child: ExpansionTile(
                    trailing: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color:
                              Theme.of(context).primaryColor.withOpacity(.13)),
                      child: Padding(
                        padding: EdgeInsets.all(0.r),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).primaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                    title: Text(
                      state.list[index].question,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.list[index].answer,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).hintColor),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Column(
              children: List.generate(
                  4,
                  (index) => Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white10,
                          child: Container(
                            height: 97.h,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(11)),
                          ),
                        ),
                      )),
            );
          }
        },
      ),
    );
  }
}
