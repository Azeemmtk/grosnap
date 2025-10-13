import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/core/widgets/title_text_widget.dart';

class NearbyStoreSection extends StatelessWidget {
  const NearbyStoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: padding, top: padding, bottom: padding),
      child: Column(
        children: [
          TitleTextWidget(title: 'Nearby stores',seeAll: true,),
        ],
      ),
    );
  }
}
