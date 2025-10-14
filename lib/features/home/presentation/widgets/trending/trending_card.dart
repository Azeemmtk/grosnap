import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: width * 0.7,
      // color: Colors.grey,
      child: Row(
        children: [
          Image.asset('assets/images/trending.png'),
          width10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mithas Bhandar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Sweets, North Indian', style: TextStyle(fontSize: 13)),
              Text(
                '(store location)  |  6.4 Kms',
                style: TextStyle(fontSize: 13),
              ),
              Row(
                children: [
                  Icon(Icons.star,size: 14,),
                  Text(' 4.1  |  45 mins', style: TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
