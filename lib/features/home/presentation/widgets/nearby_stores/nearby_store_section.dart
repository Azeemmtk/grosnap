import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/color.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/core/widgets/title_text_widget.dart';

import 'nearby_store_card.dart';

class NearbyStoreSection extends StatelessWidget {
  const NearbyStoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          TitleTextWidget(title: 'Nearby stores', seeAll: true),
          SizedBox(
            height: height * 0.32,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NearbyStoreCard();
              },
              separatorBuilder: (context, index) => height10,
              itemCount: 2,
            ),
          ),
          height20,
          height20,
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(width * 0.6, height * 0.05)
              ),
              onPressed: () {},
              child: Text('View all stores',
              style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
