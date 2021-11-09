





import 'package:ecommerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class CheckOutViewModel extends GetxController{
  int get index => _index;
  int _index = 0;
  Pages get pages =>_pages;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String street1,street2,city,state,country;


  Pages _pages = Pages.DeliveryTime;
  void changeIndex(int i){
    if(i==0 ||i<0){
      _pages=Pages.DeliveryTime;
      _index=i;
    }
    else if(i==1){
       _pages=Pages.AddAddress;
       _index=i;
     }
    else if(i==2){
      formKey.currentState.save();
     if (formKey.currentState.validate()){
        _pages=Pages.Summary;
        _index=i;

     }

     }
     else if(i==3){
       _index=0;
       _pages=Pages.DeliveryTime;
       Get.to(ControlView());

    }
     update();
  }

  Color getColor(int index) {
    if (index == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

}