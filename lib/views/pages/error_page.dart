import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trashfix/const/image_const.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_1.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();

    return Scaffold(
      appBar: appBar1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(ImageConst.error),
          ],
        ),
      ),
    );
  }
}
