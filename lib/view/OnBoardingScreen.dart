import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service_flutter/view/OnBoardingScreen2.dart';

class OnBoardingScreen extends StatelessWidget {
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
              semanticLabel: 'onBoardingImage',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text('Image not found');
              },
            ),
            SizedBox(height: 80),
            Text(
              textAlign: TextAlign.center,
              'Fast reservation with technicians and craftsmen',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xff0E9CF9),
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.off(OnBoardingScreen2());
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
