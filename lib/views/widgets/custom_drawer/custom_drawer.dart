import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/image_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/services/auth.dart';
import 'package:trashfix/services/db/db_2.dart';
import 'package:trashfix/utils/app_sizes.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final DbController2 _dbController2 = Get.find();

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConst.whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImageConst.bg),
              ),
            ),
            accountName: Text(
              _dbController2.userProfileModel[0].userName,
              style: const TextStyle(
                color: ColorConst.whiteColor,
              ),
            ),
            accountEmail: Text(
              _dbController2.userProfileModel[0].email,
              style: const TextStyle(
                color: ColorConst.whiteColor,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: AppSizes.height10 * 10,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    _dbController2.avatarImageConst(),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(StringConst.logout),
            onTap: () async {
              await _authController.signOut();
            },
          ),
        ],
      ),
    );
  }
}
