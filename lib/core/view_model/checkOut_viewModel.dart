





import 'package:ecommerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class CheckOutViewModel extends GetxController{
  int get index => _index;
  int _index = 0;
  Pages get pages =>_pages;

  Pages _pages = Pages.DeliveryTime;
  void changeIndex(int i){
    _index=i;
     if(_index==1){
       _pages=Pages.AddAddress;
     }
    else if(_index==2){
       _pages=Pages.Summary;

     }
     else if(_index==3){
       _index=0;
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