import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/home/presentation/widgets/category/category_section.dart';
import 'package:grosnap/features/home/presentation/widgets/trending/trending_section.dart';
import '../widgets/craze_deals/craze_deals_section.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/nearby_stores/nearby_store_section.dart';
import '../widgets/refer_and_earn_card.dart';
import '../widgets/top_pick_section/top_pick_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategorySection(),
              ContentGap,
              const TopPickSection(),
              ContentGap,
              const TrendingSection(),
              ContentGap,
              const CrazeDealsSection(),
              ContentGap,
              ReferAndEarnCard(),
              ContentGap,
              NearbyStoreSection(),
            ],
          ),
        ),
      ),
    );
  }
}
