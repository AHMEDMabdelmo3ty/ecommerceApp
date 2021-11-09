import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/core/view_model/checkOut_viewModel.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Expanded(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        child: Image.network(
                          controller.cartProductModel[index].image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      RichText(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: controller.cartProductModel[index].name,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 8,),
                      CustomText(
                        text: '\$ ${controller.totalPrice}',
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  );
                },
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 15,
                  );
                },
              ),
            ),
            GetBuilder<CheckOutViewModel>(

              builder:(controller)=> CustomText(
                text: "${
                    controller.street1 + ' ,' +
                    controller.street2 + ' ,' +
                    controller.state +' ,' +
                        controller.city +' ,'
                    +controller.country }",
                fontSize: 24,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
