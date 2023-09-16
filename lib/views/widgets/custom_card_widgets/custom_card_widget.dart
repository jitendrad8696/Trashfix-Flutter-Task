import 'package:flutter/material.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/utils/app_sizes.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomCard({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Checkbox.width * 0.7, vertical: AppSizes.height10),
        decoration: BoxDecoration(
          color: ColorConst.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: AppSizes.height10 * 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
