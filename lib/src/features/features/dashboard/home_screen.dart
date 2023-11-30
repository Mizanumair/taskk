import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:payhub/src/components/custom_button.dart';
import 'package:payhub/src/components/custom_divider.dart';
import 'package:payhub/src/components/custom_text.dart';
import 'package:payhub/src/core/constants/dimensions.dart';
import 'package:payhub/src/core/constants/font_weight.dart';
import 'package:payhub/src/core/constants/palette.dart';
import 'package:payhub/src/features/features/dashboard/home_controller.dart';

import '../../auth/auth_controller.dart';
import 'model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomDivider(
              height: height_20,
            ),
            Obx(() {
              final loggedInUser = authController.loggedInUser;
              return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                    text: 'Name: ${loggedInUser?['name']}',
                                    color1: AppColors.blue,
                                    fontWeight: fontWeight600,
                                    fontSize: font_15),
                                CustomDivider(
                                  height: height_10,
                                ),
                                CustomText(
                                    text: 'Email: ${loggedInUser?['email']}',
                                    color1: AppColors.blue,
                                    fontWeight: fontWeight600,
                                    fontSize: font_15),
                              ],
                            ),
                            CustomButton(
                              text: 'LogOut',
                              color: AppColors.white,
                              fontWeight: fontWeight600,
                              font: font_12,
                              width: width_80,
                              onPress: () {
                                authController.logout();
                              },
                            ),
                          ],
                        ),
                        TextField(
                          onChanged: (query) => controller.filterByName(query),
                          decoration: InputDecoration(
                            hintText: 'Search by [OK Id]',
                          ),
                        ),
                        Obx(() {

                          final details = controller.detailsModel;

                          return ListView.builder(
                            itemCount: details.length,
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final describeDet = details[index];
                              return Column(
                                children: [
                                  CustomText(
                                      text: 'Name: ${describeDet.name}',
                                      color1: AppColors.darkBlue,
                                      fontWeight: fontWeight600,
                                      fontSize: font_12,
                                  ),
                                  CustomDivider(
                                    height: height_10,
                                  ),
                                ],
                              );
                            },
                          );
                        })
                      ],
                    );
            })
          ],
        ),
      ),
    );
  }
}
