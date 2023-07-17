import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thamra/screens/home_pages/notifications/widgets/notifications_item.dart';

import '../../../features/notifications/bloc.dart';
import '../../shimmers/shimmer_listview.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final bloc = KiwiContainer().resolve<GetNotificationsBloc>()
    ..add(GetNotificationsEvents());

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
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetNotificationsSuccessStates) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  NotificationItem(notification: state.list[index]),
              itemCount: state.list.length,
            );
          } else {
            return const ShimmerListView();
          }
        },
      ),
    );
  }
}




