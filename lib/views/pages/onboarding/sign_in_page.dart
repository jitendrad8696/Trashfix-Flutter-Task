import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/services/auth.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/utils/no_leading_space_formatter.dart';
import 'package:trashfix/utils/no_leading_trailing_space_formatter.dart';
import 'package:trashfix/views/pages/onboarding/forgot_password_page.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:trashfix/views/widgets/custom_buttons/custom_button.dart';
import 'package:trashfix/views/widgets/custom_text_form_fields/custom_text_form_field.dart';
import 'package:trashfix/views/widgets/custom_titles/custom_title.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final AuthController _controller = Get.find();

  void signInWithEmail(BuildContext context) async {
    if (_key.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      await _controller.signInWithEmail(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
        context: context,
      );
    }
  }

  void onTap() {
    FocusManager.instance.primaryFocus!.unfocus();
    Get.to(() => ForgotPasswordPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: AppSizes.horizontalPadding20,
            child: Column(
              children: [
                SizedBox(height: AppSizes.height10 * 1.2),
                const CustomTitle(text: StringConst.welcomeBack),
                SizedBox(height: AppSizes.height10 * 2),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _emailController,
                        maxLines: 1,
                        hintText: StringConst.email,
                        validator: (val) {
                          if (GetUtils.isEmail(val!)) {
                            return null;
                          } else {
                            return StringConst.validEmail;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [NoLeadingTrailingSpaceFormatter()],
                        obscureText: false,
                      ),
                      SizedBox(height: AppSizes.height10 * 2),
                      CustomTextFormField(
                        controller: _passController,
                        maxLines: 1,
                        hintText: StringConst.password,
                        validator: (val) {
                          if (GetUtils.isLengthGreaterOrEqual(val!, 8)) {
                            return null;
                          } else {
                            return StringConst.enterYourPassword;
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        inputFormatters: [NoLeadingSpaceFormatter()],
                        obscureText: true,
                      ),
                      SizedBox(height: AppSizes.height10 * 2)
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.height10 * 2),
                CustomButton(
                    text: StringConst.signInWithEmail,
                    buttonColor: ColorConst.primaryColor,
                    textColor: ColorConst.whiteColor,
                    onTap: () {
                      signInWithEmail(context);
                    }),
                SizedBox(height: AppSizes.height10 * 4),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    StringConst.forgotYourPassword,
                    style: TextStyle(
                      fontSize: AppSizes.height10 * 1.8,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height10 * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
