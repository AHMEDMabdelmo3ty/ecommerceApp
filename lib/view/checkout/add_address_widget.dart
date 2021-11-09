import 'package:ecommerce/constance.dart';
import 'package:ecommerce/core/view_model/checkOut_viewModel.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder:(controller)=> Form(
        key: controller.formKey,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.album_outlined,
                        size: 25,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: CustomText(
                          text: 'billing Address is the same the delivery address',
                          fontSize: 18,
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35,),
                  CustomTextFormField(
                    onSave: (value){
                      controller.street1=value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'you must write your street';
                      }
                    },
                    text: 'street 1',
                    hint: 'القاهره , وسط البلد ,21',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onSave: (value){
                      controller.street2=value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'you must write your street2';
                      }
                    },
                    text: 'street 2',
                    hint: 'القاهره , وسط البلد ,21',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onSave: (value){
                      controller.city=value;
                    },
                    validator: (String value){
                      if(value.isEmpty){
                        return 'you must write your city';
                      }
                    },
                    text: 'city',
                    hint: 'القاهره ',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded
                          (

                          child: Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: CustomTextFormField(
                              onSave: (value){
                                controller.state=value;
                              },
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'you must write your state';
                                }
                              },
                            text: 'state',
                            hint: 'القاهره ',
                        ),
                          ),),   Expanded
                          (

                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: CustomTextFormField(
                              onSave: (value){
                                controller.country=value;
                              },
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'you must write your county';
                                }
                              },
                            text: 'country',
                            hint: 'القاهره ',
                        ),
                          ),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
