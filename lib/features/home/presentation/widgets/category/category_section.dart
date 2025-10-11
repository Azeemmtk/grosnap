import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/color.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/home/data/demi_data.dart';

import '../../../../../core/widgets/title_text_widget.dart';
import 'caterory_container.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextWidget(title: 'What would you like to do today?',),
          height10,
          height10,
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: List.generate(
              8,
              (index) => CategoryContainer(
                image: dummyCategories[index]['imagePath'],
                name: dummyCategories[index]['title'],
                offer: dummyCategories[index]['discount'],
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Text('More',style: TextStyle(color: green),),
              width5,
              Image.asset('assets/images/arrow_down _icon.png',height: 7,),
            ],
          )
        ],
      ),
    );
  }
}