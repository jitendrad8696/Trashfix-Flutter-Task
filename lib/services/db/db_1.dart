import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/firebase_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/controllers/create_profile_controller.dart';
import 'package:trashfix/main.dart';
import 'package:trashfix/views/dialogs/dialogs.dart';

class DbController1 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CreateProfileController _createProfileController = Get.find();

  Future<void> saveUserInfo(BuildContext context) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      User? user = _auth.currentUser;
      return _firestore.collection(FirebaseConst.users).doc(user!.uid).set(
        {
          FirebaseConst.userId: user.uid,
          FirebaseConst.email: user.email,
          FirebaseConst.avatar: _createProfileController.avatar(),
          FirebaseConst.userName: _createProfileController.userName(),
          FirebaseConst.phoneNumber: _createProfileController.userPhoneNumber(),
        },
      );
    } catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultDialog1(StringConst.anUnexpectedError);
      if (kDebugMode) {
        print('DbController1 saveUserInfo Error = $e');
      }
    }
  }
}
