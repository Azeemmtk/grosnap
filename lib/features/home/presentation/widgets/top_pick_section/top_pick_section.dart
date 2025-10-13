import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/core/widgets/title_text_widget.dart';
import 'package:grosnap/features/home/presentation/widgets/top_pick_section/top_pick_card.dart';

class TopPickSection extends StatelessWidget {
  const TopPickSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding, bottom: padding, top: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextWidget(title: 'Top pics for you'),
          SizedBox(
            height: height * 0.24,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                const color = [
                  Color(0xFF06C25E),
                  Color(0xFF685BCB),
                  Color(0xFF06C25E),
                ];
                return TopTickCard(color: color[index]);
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
