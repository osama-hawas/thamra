import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thamra/screens/home_pages/fav/view.dart';
import 'package:thamra/screens/home_pages/home/view.dart';
import 'package:thamra/screens/home_pages/my_order/view.dart';
import 'package:thamra/screens/home_pages/notifications/view.dart';
import 'package:thamra/screens/home_pages/profile/view.dart';

class NavView extends StatefulWidget {
  const NavView({Key? key}) : super(key: key);

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  List<String> title = ['الرئيسية', 'طلباتي', 'الإشعارات', 'المفضلة', 'حسابي'];
  List<String> iconLink = [
    'COCO-Line-Home.svg',
    'COCO-Line-Note.svg',
    'COCO-Duotone-Notification.svg',
    'Icon ionic-ios-heart-empty.svg',
    'COCO-Line-User.svg',
  ];

  int currentIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const MyOrderScreen(),
    const NotificationsScreen(),
    const FavScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Theme.of(context).primaryColor,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            iconSize: 32.sp,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
            selectedItemColor: Colors.white,
            unselectedItemColor:const Color(0xffAED489),
            type: BottomNavigationBarType.fixed,
            items: List.generate(
              title.length,
              (index) => BottomNavigationBarItem(
                  icon: Padding(
                    padding:  EdgeInsets.only(bottom: 6.h),
                    child: SvgPicture.asset(
                      "assets/icons/abb_bar/${iconLink[index]}",
                      color: currentIndex == index
                          ? Colors.white
                          :const Color(0xffAED489),
                    ),
                  ),
                  label: title[index]),
            )),
      ),
    );
  }
}
