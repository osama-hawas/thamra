import 'package:flutter/material.dart';

class CategoriItem extends StatelessWidget {
  const CategoriItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsetsDirectional.only(top: 18, start: 16,),
        child: Column(
          children: [
            Container(
              height: 73,
              width: 73,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Color(0xffF6F9F3),
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(
                'assets/images/t1.png',
                fit: BoxFit.fill,
              ),
            ),
            Text(
              'الخضار',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
