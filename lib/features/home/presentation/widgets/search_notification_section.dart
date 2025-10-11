import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/color.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:grosnap/features/notification/presentation/screens/notification_screen.dart';

class SearchNotificationSection extends StatelessWidget {
  const SearchNotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          Container(
            height: height * 0.06,
            width: width * 0.67,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                width5,
                SizedBox(
                  width: width * 0.56,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for products/stores',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
                Icon(CupertinoIcons.search, color: green, size: 30),
                width5,
              ],
            ),
          ),
          width10,
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            child: Stack(
              children: [
                Image.asset('assets/images/notification_icon.png', height: 45),
                Positioned(
                  right: width * 0.025,
                  top: height * 0.01,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 7,
                    child: Text('3', style: TextStyle(fontSize: 8)),
                  ),
                ),
              ],
            ),
          ),
          width10,
          Icon(CupertinoIcons.tag, color: Color(0xFFFFA115), size: 30),
        ],
      ),
    );
  }
}
