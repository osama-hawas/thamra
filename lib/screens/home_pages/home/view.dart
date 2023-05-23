import 'package:flutter/material.dart';
import 'package:thamra/screens/home_pages/home/widgets/categoru_item.dart';
import 'package:thamra/screens/home_pages/home/widgets/custom_app_bar.dart';
import 'package:thamra/screens/home_pages/home/widgets/product_item.dart';

import '../../../core/widgets/input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Input(
            text: 'ابحث عن ماتريد؟',
            prefixIcon: 'assets/icons/search.png',
            onChanged: (value) {},
            homeInput: true,
          ),
          Container(
            height: 164,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/testimg.png'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28, bottom: 8),
            child: Container(
              // color: Colors.amber,
              // height: 140,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 16),
                        child: Text(
                          'الأقسام',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'عرض الكل',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 135,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoriItem(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 16),
            child: Text(
              'الأصناف',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          ProductItem(),
          SizedBox(height: 16,),
        ],
      ),
    ));
  }
}
