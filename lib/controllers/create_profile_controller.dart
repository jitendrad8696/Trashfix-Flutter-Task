import 'package:get/get.dart';
import 'package:trashfix/const/image_const.dart';
import 'package:trashfix/models/user_profile_model.dart';

class CreateProfileController extends GetxController {
  final Rx<UserProfileModel> _createProfile = UserProfileModel(
    userId: "",
    email: "",
    avatar: 1,
    userName: "",
    phoneNumber: "",
  ).obs;

  void updateUserId(String userId) {
    _createProfile.update((val) {
      val!.userId = userId;
    });
  }

  void updateEmail(String email) {
    _createProfile.update((val) {
      val!.email = email;
    });
  }

  int avatar() {
    return _createProfile.value.avatar;
  }

  String avatarImageConstURL() {
    return ImageConst.avatarImageURL(_createProfile.value.avatar);
  }

  void updateAvatar(int avatar) {
    _createProfile.update((val) {
      val!.avatar = avatar;
    });
  }

  String userName() {
    return _createProfile.value.userName;
  }

  void updateUserName(String userName) {
    _createProfile.update((val) {
      val!.userName = userName;
    });
  }

  String userPhoneNumber() {
    return _createProfile.value.phoneNumber;
  }

  void updateUserPhoneNumber(String phoneNumber) {
    _createProfile.update((val) {
      val!.phoneNumber = phoneNumber;
    });
  }
}
