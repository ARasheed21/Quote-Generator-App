import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ViewFavContainer extends StatelessWidget {
  const ViewFavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 353,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      child: Text(
        'Click Here To View Favorite Quotes',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppColors.dark,
          fontFamily: 'GemunuLibre',
        ),
      ),
    );
  }
}
