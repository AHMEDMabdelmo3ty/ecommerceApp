import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: Get.put(ProfileViewModel()),
        builder: (controller) => Container(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        image: DecorationImage(
                            image: controller.userModel.pic == null
                                ? AssetImage('assets/images/Icon_User.png')
                                : controller.userModel.pic == "default"
                                    ? AssetImage('assets/images/Icon_User.png')
                                    : NetworkImage(controller.userModel.pic),fit: BoxFit.fill),
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: controller.userModel.name,
                          fontSize: 24,

                        ),
                        SizedBox(height: 20,),
                        CustomText(
                          text: controller.userModel.email,
                          fontSize: 24,

                        )
                      ],
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
