import 'package:get/get.dart';
import 'package:health_hub_app/users/articlePreferences/articleManipulation.dart';
import 'package:flutter/material.dart';
import 'package:health_hub_app/pages/home/widgets/widgets.options/box.options.dart';
import 'package:health_hub_app/users/userPreferences/current_user.dart';

class OptionsField extends StatefulWidget {
  const OptionsField({super.key});

  @override
  State<OptionsField> createState() => _OptionsFieldState();
}

class _OptionsFieldState extends State<OptionsField> {
  CurrentUser _currentUser = Get.put(CurrentUser());
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        FutureBuilder(
          builder: (ctx, snapshot) {
            // Checking if future is resolved
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            // If we got an error
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: TextStyle(fontSize: 18),
                ),
              );

              // if we got our data
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (var item in snapshot.data!)
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        BoxField(
                            article: item,
                            boxName: item.article_title,
                            boxImage: "assets/articles.jpg",
                            route: "0"),
                      ],
                    ),
                ],
              );
            }
          },
          future: getArticles(_currentUser.user.user_email),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
