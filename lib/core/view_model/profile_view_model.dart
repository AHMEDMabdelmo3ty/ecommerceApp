
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  getCurrentUser();
  }
  final LocalStorageData localStorageData = Get.find();
  UserModel _userModel;
  UserModel get userModel=>_userModel;
  void getCurrentUser()async{
    await localStorageData.getUser.then((value) {
      _userModel=value;
    });
    update();
  }


 Future<void> signOut()async{
   GoogleSignIn().signOut();
   FirebaseAuth.instance.signOut();
   localStorageData.deletedUser();
  }
}
