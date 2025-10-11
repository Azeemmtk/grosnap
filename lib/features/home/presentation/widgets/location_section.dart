import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/color.dart';
import 'package:grosnap/core/utils/const.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          Icon(Icons.location_on_rounded, color: green,size: 25,),
          Text(
            'ABCD, New Delhi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          width5,
          Image.asset('assets/images/arrow_down _icon.png'),
        ],
      ),
    );
  }
}
