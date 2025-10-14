import 'package:flutter/material.dart';
import 'package:grosnap/features/home/presentation/widgets/search_notification_section.dart';

import '../../../../core/utils/const.dart';
import 'location_section.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height * 0.125);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          // BoxShadow(
          //   color: Colors.black12,
          //   offset: Offset(0, 3),
          //   blurRadius: 6,
          // ),
        ],
      ),
      padding: EdgeInsets.only(
        top: height * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LocationSection(),
          SizedBox(height: height * 0.015),
          const SearchNotificationSection(),
        ],
      ),
    );
  }
}
