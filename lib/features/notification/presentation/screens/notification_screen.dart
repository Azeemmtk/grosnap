import 'package:flutter/material.dart';
import 'package:grosnap/core/di/injection.dart';
import 'package:grosnap/core/utils/color.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/notification/presentation/provider/bloc/notification_bloc.dart';
import 'package:grosnap/features/notification/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/notification_card_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifications'),
      body: BlocProvider(
        create: (context) => getIt<NotificationBloc>()..add(GetNotificationEvent()),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            print('BlocBuilder state: $state');
            if(state is NotificationLoading){
              return Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              );
            }else if(state is NotificationLoaded){
              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: padding),
                itemBuilder: (context, index) {
                  final notification= state.notifications[index];
                  print(notification);
                  return NotificationCardWidget(
                    body: notification.body,
                    title: notification.title,
                    image: notification.image,
                    time: notification.timestamp,
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(
                      color: Color(0xFFD2D2D2),
                    ),
                itemCount: state.notifications.length,
              );
            }else if(state is NotificationError){
              return Center(
                child: Text(state.message),
              );
            }
            return Center(
              child: Text('No notifications'),
            );
          },
        ),
      ),
    );
  }
}

