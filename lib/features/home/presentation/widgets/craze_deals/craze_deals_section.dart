import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/core/widgets/title_text_widget.dart';
import 'package:grosnap/features/home/presentation/widgets/craze_deals/craze_deal_card.dart';

class CrazeDealsSection extends StatelessWidget {
  const CrazeDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: padding, top: padding, bottom: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextWidget(title: 'Craze deals'),
          SizedBox(
            height: height * 0.2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CrazeDealCard();
              },
              separatorBuilder: (context, index) => width10,
              itemCount: 3,
            ),
          ),

        ],
      ),
    );
  }
}
