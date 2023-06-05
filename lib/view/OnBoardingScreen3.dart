import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service_flutter/main.dart';

import 'LoginScreen.dart';

class OnBoardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/mobile_application_call_taxi.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
              semanticLabel: 'onBoardingImage3',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text('Image not found');
              },
            ),
            SizedBox(height: 20),
            Text(
              'Fast reservation with technicians and craftsmen',
              style: GoogleFonts.pacifico(
                fontSize: 23,
                color: Color(0xff0E9CF9),
              ),
            ),
            SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.off(LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff346EDF),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 64,
                  alignment: Alignment.center,
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cursive',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
