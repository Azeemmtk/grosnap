import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/notification/utils/formate_time.dart';
import 'package:grosnap/features/notification/utils/notification_image_controller.dart';
import '';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({super.key, required this.image, required this.title, required this.body, required this.time, });

  final String image;
  final String title;
  final String body;
  final DateTime time;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding- 10, horizontal: padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
              notificationImage(image),
              fit: BoxFit.cover,
            ),
          ),
          width10,
          SizedBox(
            width: width * 0.79,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                height5,
                Text(
                  body,
                  style: TextStyle(fontSize: 14),
                ),
                height5,
                Text(
                  formatTime(time.toString()),
                  style: TextStyle(fontSize: 12, color: Color(0xff727272)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
