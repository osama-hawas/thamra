import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الإشعارات',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => NotivayItem(),
        itemCount: 3,
      ),
    );
  }
}

class NotivayItem extends StatelessWidget {
  const NotivayItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin:
          EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16, top: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
            height: 33,
            width: 33,
            decoration: BoxDecoration(
                color: Color(0xff4C8613).withOpacity(.13),
                borderRadius: BorderRadius.circular(9)),
            child: Image.asset('assets/images/item.png',fit: BoxFit.fill,),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تم قبول طلبك وجاري تحضيره الأن',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6,),
                Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                  style: TextStyle(fontSize: 10, color: Color(0xff989898),fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2,),
                Text('منذ ساعتان',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
