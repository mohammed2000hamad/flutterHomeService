import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service_flutter/view/OrderDoneScreen.dart';
import 'HomeScreen.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

TextEditingController problemController = TextEditingController();
TextEditingController locationController = TextEditingController();
TextEditingController phoneController = TextEditingController();




class _CreateOrderScreenState extends State<CreateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff346EDF),
                  Color(0xff6FC8FB),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Get.off(HomeScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 20.0),
                  ),
                  Expanded(flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Create Order',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DottedBorder(
              dashPattern: [8, 4],
              strokeWidth: 1,
              color: Colors.grey,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('images/image_icon.png')),
                    SizedBox(width: 8),
                    Text(
                      'Image Problem',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              width: double.infinity,
              child: Text(
                'image must be no more than 2 MB Max 5 Image',
                style: GoogleFonts.poppins(
                  fontSize: 8,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Container(
              child: TextField(
                controller: problemController,
                decoration: InputDecoration(
                  labelText: 'More Details About Problem …',
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF346EDF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF346EDF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Container(
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: 'Location address details',
                  labelStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF346EDF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF346EDF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Container(
              width: double.infinity,
              height: 64,
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Enter your Phone number',
                  labelStyle: GoogleFonts.poppins(
                    textStyle: GoogleFonts.poppins(),
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF346EDF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF346EDF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.phone,
                maxLines: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.off(OrderDoneScreen());
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
                  'Create',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),



        ]),
      ),
    );
  }
}
