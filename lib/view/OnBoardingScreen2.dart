import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OnBoardingScreen3.dart';

class OnBoardingScreen2 extends StatelessWidget {
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
              'images/onbording_image.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
              semanticLabel: 'onBoardingImage2',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text('Image not found');
              },
            ),
            SizedBox(height: 80),
            Text(
              'Prestige and Absolute Security',
              style: GoogleFonts.pacifico(
                fontSize: 23,
                color: Color(0xffFFC400),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Fast reservation with technicians and craftsmen',
                style: GoogleFonts.pacifico(
                  fontSize: 23,
                  color: Color(0xff0E9CF9),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(OnBoardingScreen3());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff346EDF),
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
                    'Next',
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
