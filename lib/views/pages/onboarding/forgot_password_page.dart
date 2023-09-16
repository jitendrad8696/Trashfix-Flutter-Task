import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/services/auth.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/utils/no_leading_trailing_space_formatter.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:trashfix/views/widgets/custom_buttons/custom_button.dart';
import 'package:trashfix/views/widgets/custom_text_form_fields/custom_text_form_field.dart';
import 'package:trashfix/views/widgets/custom_titles/custom_title.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final AuthController _controller = Get.find();

  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void onTap(BuildContext context) async {
    if (_key.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      await _controller.forgotPassword(_emailController.text.trim(), context);
    }
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
                const CustomTitle(text: StringConst.forgotPassword),
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
                      SizedBox(height: AppSizes.height10 * 2)
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.height10 * 2),
                CustomButton(
                  text: StringConst.resetPassword,
                  buttonColor: ColorConst.primaryColor,
                  textColor: ColorConst.whiteColor,
                  onTap: () {
                    onTap(context);
                  },
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
