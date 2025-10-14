import 'package:flutter/material.dart';
import '../../../../../core/utils/const.dart';

class CrazeDealCard extends StatelessWidget {
  const CrazeDealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.2,
          width: width - 3 * padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
        ),
        Positioned(
          bottom: 40,
          left: 25,
          child: Row(
            children: [
              Text(
                'Explore ',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFFF8918),
                  letterSpacing: 1,
                ),
              ),
              Icon(Icons.arrow_forward_outlined,color: Color(0xFFFF8918),size: 18, )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset('assets/images/wegitable_image.png'),
        ),
        Positioned(
            left: 25,
            top: 35,
            child: SizedBox(
              width: width * 0.6,
              child: Text('Customer favourite top supermarkets',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 23,

              ),),
            )),
      ],
    );
  }
}
