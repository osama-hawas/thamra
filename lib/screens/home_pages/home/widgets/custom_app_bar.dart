import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Container(
          alignment: Alignment.center,
          // height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 24,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 2),
                child: Text(
                  'سلة ثمار',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              const  Spacer(),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'التوصيل إلى',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: Theme.of(context).primaryColor),
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'شارع الملك فهد - جدة',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const  Spacer(),
              Badge(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff4C8613).withOpacity(.13)),
                    child: Icon(
                        Icons.shopping_bag_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 28,
                    ),
                  ),
                ),
                badgeStyle: BadgeStyle(
                  badgeColor: Theme.of(context).primaryColor,
                ),
                badgeContent:const Text(
                  '3',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 6,
                      fontWeight: FontWeight.bold),
                ),
                position: BadgePosition.custom(start: 3, top: -10),
              ),
            ],
          ),

    );
  }
}
