import 'package:flutter/material.dart';

import '../../../../../core/utils/const.dart';

class TopTickCard extends StatelessWidget {
  const TopTickCard({
    super.key, required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.24,
          width: width - 3 * padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
        ),
        Positioned(
            left: 25,
            bottom: 70,
            child: SizedBox(
              width: width * 0.33,
              child: Text('DISCOUNT 25% ALL FRUITS',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,

              ),),
            )),
        Positioned(
          bottom: 25,
          left: 25,
          child: Container(
            height: height * 0.04,
            width: width * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0xFFFF8918),
            ),
            child: Center(
              child: Text(
                'CHECK NOW',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 20,
          child: Image.asset('assets/images/top_pick_fruits.png'),
        ),
      ],
    );
  }
}
