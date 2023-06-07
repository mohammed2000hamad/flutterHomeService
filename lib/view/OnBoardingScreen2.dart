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
              height: 280,
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
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xffFFC400),

              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Fast reservation with technicians and craftsmen',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xff0E9CF9),
                ),
                textAlign: TextAlign.center,

              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.off(OnBoardingScreen3());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, primary: Color(0xff346EDF),
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 36,
                  alignment: Alignment.center,
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white
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
