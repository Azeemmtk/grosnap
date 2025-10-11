import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.image, required this.name, required this.offer});

  final String image;
  final String name;
  final int offer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            offer !=0
            ? Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 18,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF9C37EC),
                ),
                child: Center(
                  child: Text(
                    '$offer % off',
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ),
              ),
            )
            : SizedBox(),
            Image.asset(image),
          ],
        ),
        height10,
        SizedBox(
          width: 70,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: Color(0xFF323232),
            ),
          ),
        ),
      ],
    );
  }
}
