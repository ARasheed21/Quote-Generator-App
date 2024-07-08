import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BackToHomeContainer extends StatelessWidget {
  const BackToHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 353,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back_ios_new_rounded),
          SizedBox(
            width: 10,
          ),
          Text(
            'Back To Home Screen',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: AppColors.dark,
              fontFamily: 'GemunuLibre',
            ),
          ),
        ],
      ),
    );
  }
}
