import 'package:flutter/material.dart';
import 'package:quiz_application/service/pref_handler.dart';
import 'package:quiz_application/views/auth/introduction_screen.dart';
import 'package:quiz_application/views/utils/constant/app_color.dart';
import 'package:quiz_application/views/utils/constant/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    // get data user
    var userId = await PreferenceHandler.getId();
    // print(userId);
    Future.delayed(Duration(seconds: 1), () {
      if (userId != '') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroScreen()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      body: Center(
        child: Image.asset(
          AppImage.logo,
          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
