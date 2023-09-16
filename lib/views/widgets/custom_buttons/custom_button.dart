import 'package:flutter/material.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/utils/app_sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSizes.height10 * 4.5,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: ColorConst.greyColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style:
                TextStyle(fontSize: AppSizes.height10 * 1.5, color: textColor),
          ),
        ),
      ),
    );
  }
}
