
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  getCurrentUser();
  }
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  final LocalStorageData localStorageData = Get.find();
  UserModel _userModel;
  UserModel get userModel=>_userModel;
  void getCurrentUser()async{
    _loading.value = true;

    await localStorageData.getUser.then((value) {
      _userModel=value;
    });
    _loading.value = false;

    update();
  }


 Future<void> signOut()async{
   GoogleSignIn().signOut();
   FirebaseAuth.instance.signOut();
   localStorageData.deletedUser();
  }
}
