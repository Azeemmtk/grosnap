import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/color.dart';

import '../utils/const.dart';

class TitleTextWidget extends StatelessWidget {
  TitleTextWidget({super.key, required this.title, this.seeAll = false});

  final String title;
  bool seeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: padding),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              seeAll
                  ? Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: greenDark,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
        SizedBox(height: height * 0.015),
      ],
    );
  }
}
