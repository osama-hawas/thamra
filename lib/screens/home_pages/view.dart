import 'package:flutter/material.dart';
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
  int index = 0;
  List<Widget> pages = [
    HomeScreen(),
    MyOrderScreen(),
    NotificationsScreen(),
    FavScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          backgroundColor: Theme.of(context).primaryColor,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          iconSize: 32,
          selectedFontSize: 12,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedItemColor: Color(0xffAED489),
          selectedIconTheme: IconThemeData(color: Colors.white),
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.reorder_outlined), label: 'طلباتي'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined), label: 'الإشعارات'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded), label: 'المفضلة'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
          ],
        ),
      ),
    );
  }
}
