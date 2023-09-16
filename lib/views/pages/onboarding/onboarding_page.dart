import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/image_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/views/pages/onboarding/sign_in_page.dart';
import 'package:trashfix/views/pages/onboarding/sign_up_page.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:trashfix/views/widgets/custom_buttons/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1,
      backgroundColor: ColorConst.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: ColorConst.whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(ImageConst.json1),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: AppSizes.horizontalPadding20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: StringConst.getStarted,
                      buttonColor: ColorConst.primaryColor,
                      textColor: ColorConst.whiteColor,
                      onTap: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        Get.to(() => SignUpPage());
                      },
                    ),
                    SizedBox(height: AppSizes.height10 * 2.5),
                    CustomButton(
                      text: StringConst.gotAnAccount,
                      buttonColor: ColorConst.secondaryColor,
                      textColor: ColorConst.whiteColor,
                      onTap: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        Get.to(() => SignInPage());
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
