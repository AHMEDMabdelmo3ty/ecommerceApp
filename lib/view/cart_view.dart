import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/widgets/custom_buttom.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance.dart';

class CartView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Column(
        children: [ const SizedBox(height: 60,),
          GetBuilder<CartViewModel>(
              init: Get.find(),
              builder:(controller)=>Expanded(
            child:  Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          child: Image.network(
                            controller.cartProductModel[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),

                        Padding(
                          padding:const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.cartProductModel[index].name,
                                fontSize: 24,
                              ), const SizedBox(height: 10,),
                              CustomText(
                                text: "\$ ${controller.cartProductModel[index].price}",
                                color: primaryColor,
                                fontSize: 18,
                              ), const SizedBox(height: 10,),
                              Container(
                                color: Colors.grey.shade200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        controller.increaseQuantity(index);
                                      },
                                      child: Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    CustomText(
                                      text: controller.cartProductModel[index].quantity.toString(),
                                      fontSize: 20,
                                    ),
                                    const SizedBox(width: 15,),
                                    GestureDetector(
                                      onTap: (){
                                        controller.decreaseQuantity(index);
                                      },
                                      child:  Container(
                                        padding: const EdgeInsets.only(bottom: 20),
                                        child: Icon(Icons.minimize),),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: controller.cartProductModel.length,
              ),
            ),
          )),
          Container(
            height: 100,
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CustomText(
                          text: 'TOTEl',
                          fontSize: 20,
                        )  ,
                        SizedBox(height: 20,),
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                      builder:(controller)=>CustomText(
                        text: '\$ ${controller.totalPrice}',
                          fontSize: 20,
                          color: primaryColor,
                        ),)
                      ],
                    ),
                  ),
                  Container(
                      padding:const EdgeInsets.all(20),
                      height: 100,
                      width: 180,
                      child: CustomButton(onPress: (){},text: 'CHECK OUT',))
                ],
              ))
        ],
      ),
    );
  }
}
