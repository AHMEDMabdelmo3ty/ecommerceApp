import 'package:ecommerce/constance.dart';
import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: Get.put(ProfileViewModel()),
        builder: (controller) => Container(
          padding: EdgeInsets.only(top: 50),
          child: controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(120),
                                image: DecorationImage(
                                    image: controller.userModel == null
                                        ? AssetImage(
                                            'assets/images/Icon_User.png')
                                        : controller.userModel.pic == "default"
                                            ? AssetImage(
                                                'assets/images/Icon_User.png')
                                            : NetworkImage(
                                                controller.userModel.pic),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel.name,
                                  fontSize: 24,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  text: controller.userModel.email,
                                  fontSize: 24,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      _listTileEdit(
                        text: 'edit profile',
                        onTap: () {},
                        iconLeading: Icons.edit,
                      ),

                      _listTile(
                        text: 'shipping Address',
                        onTap: () {},
                        iconLeading: Icons.location_on_outlined,
                      ),
                      
                      _listTile(
                        text: 'order history',
                        onTap: () {},
                        iconLeading: Icons.access_time_sharp,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _listTile(
                        text: 'Cards',
                        onTap: () {},
                        iconLeading: Icons.credit_card,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _listTile(
                        text: 'notification',
                        onTap: () {},
                        iconLeading: Icons.notifications_on_sharp,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _listTile(
                        text: 'logout',
                        onTap: () {
                          controller.signOut();
                          Get.offAll(LoginView());
                        },
                        iconLeading: Icons.logout,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _listTile({
    Function onTap,
    String text,
    IconData iconLeading,
  }) {
    return Container(
      child: ListTile(
        onTap: onTap,
        title: CustomText(
          text: text,
        ),
        leading: Icon(
          iconLeading,
          size: 30,
          color: primaryColor,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _listTileEdit({
    Function onTap,
    String text,
    IconData iconLeading,
  }) {
    return Container(
      child: ListTile(
        onTap: onTap,
        title: CustomText(
          text: text,
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconLeading,
              size: 30,
              color: primaryColor,
            ),
            Container(
              height: 2,
              width: 25,
              decoration: BoxDecoration(
                  color:Colors.black , borderRadius: BorderRadius.circular(15)),
            )
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.black,
        ),
      ),
    );
  }
}
