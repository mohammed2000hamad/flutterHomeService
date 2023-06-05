import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_flutter/main.dart';
import 'package:home_service_flutter/view/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../PreferenceManager.dart';
import 'OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToScreen();
  }

  void navigateToScreen() async {
    // Delay for 2.5 seconds
    await Future.delayed(Duration(milliseconds: 2500));

    // Retrieve the token from SharedPreferences
    final token = await _getTokenFromSharedPreferences();

    if (token != null) {
      // Token exists, navigate to the home screen
      Get.offAll(HomeScreen());
    } else {

      Get.offAll(OnBoardingScreen());
    }
  }

  Future<String?> _getTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF346EDF), Color(0xFF6FC8FB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            'images/app_icon.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
