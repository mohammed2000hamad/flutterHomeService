import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service_flutter/view/HomeScreen.dart';

class OrderDoneScreen extends StatelessWidget {
  const OrderDoneScreen({super.key});

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
              'images/create_done_img.png',
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
              semanticLabel: 'image',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Text('Image not found');
              },
            ),
            SizedBox(height: 80),
            Text(
              textAlign: TextAlign.center,
              'Order Created Successfully we will contact you',
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
                  Get.off(HomeScreen());
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
                    'Go to home',
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


