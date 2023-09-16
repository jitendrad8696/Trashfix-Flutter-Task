import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/image_const.dart';
import 'package:trashfix/utils/app_sizes.dart';

AppBar appBar1 = AppBar(
  automaticallyImplyLeading: false,
  elevation: 0,
  centerTitle: true,
  toolbarHeight: AppSizes.height10 * 6,
  backgroundColor: ColorConst.primaryColor,
  systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(AppSizes.height10 * 3),
    ),
  ),
  title: Image.asset(
    ImageConst.appBarImage,
    height: 60,
  ),
);
