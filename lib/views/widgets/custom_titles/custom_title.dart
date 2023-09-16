import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/font_const.dart';
import 'package:trashfix/utils/app_sizes.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: ColorConst.primaryColor,
            size: AppSizes.height10 * 3.6,
          ),
          onTap: () {
            Get.back();
          },
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppSizes.height10 * 2.4,
              fontWeight: FontWeight.bold,
              fontFamily: FontConst.nunitoSans,
            ),
          ),
        )
      ],
    );
  }
}
