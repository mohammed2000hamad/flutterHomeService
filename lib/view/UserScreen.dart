import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff346EDF), Color(0xff6FC8FB)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 120.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Text(
                            "Mohammed Hamad Mushtaha",
                            style: GoogleFonts.pacifico(
                              fontSize: 18.0,
                              color: Colors.black,

                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.0, bottom: 16.0),
                        child: Text(
                          "Gaza.Palestine 970",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Color(0xAE6D6D6D),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 8.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x80346EDF),
                            Color(0x806FC8FB),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Language",
                              style: GoogleFonts.pacifico(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 16.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "My Rates",
                              style: GoogleFonts.pacifico(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 16.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Contact us",
                              style: GoogleFonts.pacifico(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 16.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Share App",
                              style: GoogleFonts.pacifico(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 16.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 8.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x80346EDF),
                            Color(0x806FC8FB),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Handle sign out logic here
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "SIGN OUT",
                                style: GoogleFonts.pacifico(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50.0,
              left: 0.0,
              right: 0.0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4.0,
                      color: Color(0xff6FC8FB),
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'images/user_avater_icon.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
