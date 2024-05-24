import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub_app/pages/articles/fillarticles.dart';
import 'package:health_hub_app/pages/home/home.page.dart';
import 'package:health_hub_app/pages/user_profile/userProfile.dart';

class MenuField extends StatelessWidget {
  const MenuField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          height: 58,
          color: Color(0xffebecee),
          child: IconTheme(
            data: IconThemeData(color: Color(0xffb9bfc7), size: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(WriteArticles());
                    },
                    child: Icon(Icons.settings)),
                FloatingActionButton(
                  backgroundColor: Color(0xff58e3c5),
                  onPressed: () {
                    Get.to(HomePage());
                  },
                  child: Icon(Icons.home, color: Colors.white, size: 35),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(ProfileScreen());
                    },
                    child: Icon(Icons.account_circle_rounded))
              ],
            ),
          )),
    );
  }
}
