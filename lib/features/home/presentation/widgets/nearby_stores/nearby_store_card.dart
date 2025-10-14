import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';

class NearbyStoreCard extends StatelessWidget {
  const NearbyStoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/nearby_stores/dry fruits.png'),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.grey,
                width: width * 0.68,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Freshly baker',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        height5,
                        Text(
                          'Sweets, North Indian',
                          style: TextStyle(fontSize: 13),
                        ),
                        Text(
                          'Site No - 1  |  6.4 Kms',
                          style: TextStyle(fontSize: 13),
                        ),
                        height5,
                        Container(
                          height: 20,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            color: Color(0xffe3e5f1),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              'Top Store',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, size: 18),
                            Text(' 4.1', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Text(
                          '45 mins  ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEA7E00),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.68,
                child: Divider(color: Color(0xffDEDEDE)),
              ),
              Row(
                children: [
                  Image.asset('assets/images/nearby_stores/offer.png'),
                  width5,
                  Text(
                    'Upto 10% OFF',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  width10,
                  Image.asset('assets/images/nearby_stores/availability.png'),
                  width5,
                  Text(
                    '3400+ items available',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
