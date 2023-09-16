import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/controllers/create_profile_controller.dart';
import 'package:trashfix/main.dart';
import 'package:trashfix/services/auth.dart';
import 'package:trashfix/services/db/db_1.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/utils/no_leading_trailing_space_formatter.dart';
import 'package:trashfix/views/pages/home/home.dart';
import 'package:trashfix/views/pages/onboarding/avatar_choose_page.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:trashfix/views/widgets/custom_buttons/custom_button.dart';
import 'package:trashfix/views/widgets/custom_text_form_fields/custom_text_form_field.dart';
import 'package:trashfix/views/widgets/custom_titles/custom_title.dart';

class CreateProfilePage extends StatelessWidget {
  CreateProfilePage({Key? key}) : super(key: key);

  final _controller = Get.put(CreateProfileController());

  final _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void onTap(BuildContext context) async {
    if (_key.currentState!.validate()) {
      FocusManager.instance.primaryFocus!.unfocus();
      _controller.updateUserName(_nameController.text.trim());
      _controller.updateUserPhoneNumber(_phoneController.text.trim());
      DbController1 controller1 = DbController1();
      await controller1.saveUserInfo(context);
      navigatorKey.currentState!.pop();
      AuthController authController = Get.find();
      await authController.getUserInfo();
      Get.offAll(() => const HomePage());
    }
  }

  void onTap2() {
    FocusManager.instance.primaryFocus!.unfocus();
    Get.to(() => AvatarChoosePage());
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar1,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          child: Padding(
            padding: AppSizes.horizontalPadding20,
            child: Column(
              children: [
                SizedBox(height: AppSizes.height10),
                const CustomTitle(text: StringConst.createProfile),
                SizedBox(height: AppSizes.height10 * 2),
                GestureDetector(
                  onTap: onTap2,
                  child: Stack(
                    children: [
                      Center(
                        child: Obx(
                          () => Image.asset(
                            _controller.avatarImageConstURL(),
                            height: AppSizes.height10 * 10,
                          ),
                        ),
                      ),
                      Positioned(
                        left: AppSizes.width10 * 20.5,
                        top: AppSizes.height10 * 6.7,
                        child: CircleAvatar(
                          backgroundColor: ColorConst.primaryColor,
                          radius: AppSizes.height10 * 1.5,
                          child: Icon(
                            Icons.create_rounded,
                            size: AppSizes.height10 * 2,
                            color: ColorConst.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.height10 * 2),
                Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _nameController,
                        maxLines: 1,
                        hintText: StringConst.chooseUserName,
                        validator: (val) {
                          if (GetUtils.isLengthGreaterOrEqual(val!, 3)) {
                            return null;
                          } else {
                            return StringConst.chooseValidUserName;
                          }
                        },
                        keyboardType: TextInputType.name,
                        inputFormatters: const [],
                        obscureText: false,
                      ),
                      SizedBox(height: AppSizes.height10 * 2),
                      CustomTextFormField(
                        controller: _phoneController,
                        maxLines: 1,
                        hintText: StringConst.enterYourPhone,
                        validator: (val) {
                          if (GetUtils.isPhoneNumber(val!)) {
                            return null;
                          } else {
                            return StringConst.enterValidPhoneNumber;
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [NoLeadingTrailingSpaceFormatter()],
                        obscureText: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.height10 * 4),
                CustomButton(
                  text: StringConst.continueButtonString,
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
