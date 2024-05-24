import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:health_hub_app/pages/home/home.page.dart';
import 'package:health_hub_app/users/authentication/login/login.page.dart';
import 'package:health_hub_app/users/userPreferences/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xff58e3c5),
        ),
        title: "Health Hub",
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: RememberUserPrefs.readUserInfo(),
            builder: (context, dataSnapShot) {
              if (dataSnapShot.data == null) {
                return LoginPage();
              } else {
                return HomePage();
              }
            }));
  }
}
