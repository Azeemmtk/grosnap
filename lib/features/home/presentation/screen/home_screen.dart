import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/home/presentation/widgets/category/category_section.dart';

import '../widgets/location_section.dart';
import '../widgets/search_notification_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        LocationSection(),
        SizedBox(
          height: height * 0.03,
        ),
        SearchNotificationSection(),
        SizedBox(
          height: height * 0.03,
        ),
        CategorySection(  ),
      ],
    );
  }
}
