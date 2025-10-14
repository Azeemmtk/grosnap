import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/core/widgets/title_text_widget.dart';
import 'package:grosnap/features/home/presentation/widgets/trending/trending_card.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: padding, top: padding, bottom: padding),
      child: Column(
        children: [
          TitleTextWidget(title: 'Trending',seeAll: true,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: List.generate(4, (index) {
                    return TrendingCard() ;
                  },) ,
                ),
                height20,
                Row(
                  children: List.generate(4, (index) {
                    return TrendingCard() ;
                  },) ,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
