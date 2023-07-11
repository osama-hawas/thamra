import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/design/main_product_item.dart';
import '../../features/fav/bloc.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final bloc = KiwiContainer().resolve<GetFavBloc>()
    ..add(GetFavProductEvents());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {

            if (state is GetFavSuccessState ) {
              return Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "المفضلة",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.list.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: double.minPositive,
                          childAspectRatio: 163 / 215),
                      itemBuilder: ((context, index) {
                        return MainProductItem(productData: state.list[index],);
                      })),
                ],
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
      )),
    );
  }
}
