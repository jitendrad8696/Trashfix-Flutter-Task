import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/image_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/controllers/create_profile_controller.dart';
import 'package:trashfix/utils/app_sizes.dart';
import 'package:trashfix/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:trashfix/views/widgets/custom_titles/custom_title.dart';

class AvatarChoosePage extends StatelessWidget {
  AvatarChoosePage({Key? key}) : super(key: key);

  final CreateProfileController _controller = Get.find();

  void onTap(int i) {
    _controller.updateAvatar(i);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1,
      body: SafeArea(
        child: Padding(
          padding: AppSizes.horizontalPadding20,
          child: Column(
            children: [
              SizedBox(height: AppSizes.height10),
              const CustomTitle(text: StringConst.chooseAvatar),
              SizedBox(height: AppSizes.height10),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 55,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Center(
                            child: Image.asset(
                              ImageConst.avatarImageURL(index + 1),
                              height: AppSizes.height10 * 14,
                            ),
                          ),
                          onTap: () {
                            onTap(index + 1);
                          },
                        ),
                        GestureDetector(
                          child: Center(
                            child: Image.asset(
                              ImageConst.avatarImageURL(index + 56),
                              height: AppSizes.height10 * 14,
                            ),
                          ),
                          onTap: () {
                            onTap(index + 56);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
