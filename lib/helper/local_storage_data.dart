import 'dart:convert';

import 'package:ecommerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constance.dart';

class LocalStorageData extends GetxController {
  Future<UserModel>get getUser async{
    try {
      UserModel user =await _getUserData();
      if(user == null){
        return null;
      }
      return user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }

 _getUserData()async{
   SharedPreferences pref =await SharedPreferences.getInstance();
   var value =pref.getString(CACHED_USER_DATA);
   return UserModel.fromJson(json.decode(value));
 }
 setUser (UserModel userModel)async{
   SharedPreferences pref =await SharedPreferences.getInstance();
await pref.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
 }
 void deletedUser()async{
   SharedPreferences pref =await SharedPreferences.getInstance();
   await pref.clear();
 }
}
