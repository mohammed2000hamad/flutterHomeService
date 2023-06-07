import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service_flutter/view/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/AllWorkController.dart';
import '../backend/UserController.dart';
import '../model/WorkModel.dart';
import 'HomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String selectedService = "Select Service";

  bool rememberMe = false;

  final UserController _userController = UserController();

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  Future<void> _register() async {
    final email = emailController.text;
    final password = passwordController.text;
    final phone = phoneNumberController.text;
    final name = fullNameController.text;

    try {
      final user =
          await _userController.registerUser(name, email, password, phone);

      if (user != null) {
        final token = user.token;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        showToast("Registered successful");
        Get.off(HomeScreen());
      } else {
        showToast("try to register again");
      }
    } catch (e) {
      // Handle login error
      showToast("Register failed : $e");
    }
    ;
  }

  List<WorkModel> _works = [];
  final AllWorkController _workController = AllWorkController();

  @override
  void initState() {
    super.initState();
    _fetchWorks(); // Call the function to fetch works data
  }

  Future<void> _fetchWorks() async {
    try {
      final works = await _workController.apiService.getAllWorks();
      setState(() {
        _works = works;
      });
    } catch (e) {
      print('Failed to fetch works: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var work = <String>[];
    for (int x = 0; x < _works.length; x++) {
      work.add(_works[x].name);
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Account Sign in')),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Customer',
              ),
              Tab(
                text: 'Service Provider',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (newValue) {
                              setState(() {
                                rememberMe = newValue ?? false;
                              });
                            },
                          ),
                          Text('I Read and Accept',
                              style: TextStyle(fontSize: 8)),
                          TextButton(
                            onPressed: () {
                              // Handle Home Service Terms & Conditions button tap
                            },
                            child: Text(
                              'Home Service Terms & Conditions',
                              style: TextStyle(
                                fontSize: 6,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Have Account?',
                            style: GoogleFonts.poppins(fontSize: 10),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.off(LoginScreen());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          _register();

                          // Perform registration logic
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Register',
                              style: GoogleFonts.poppins(fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(color: Color(0xff346EDF), width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      hint: selectedService == null
                          ? Text('Dropdown')
                          : Text(
                              selectedService,
                              style: TextStyle(color: Colors.blue),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: work.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (String? val) {
                        setState(
                          () {
                            selectedService = val!;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (newValue) {
                          setState(() {
                            rememberMe = newValue ?? false;
                          });
                        },
                      ),
                      Text('I Read and Accept', style: TextStyle(fontSize: 8)),
                      TextButton(
                        onPressed: () {
                          // Handle Home Service Terms & Conditions button tap
                        },
                        child: Text(
                          'Home Service Terms & Conditions',
                          style: TextStyle(
                            fontSize: 6,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Have Account?',
                            style: GoogleFonts.poppins(fontSize: 10),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.off(LoginScreen());
                            },
                            child: Text('Login',
                                style: GoogleFonts.poppins(fontSize: 10)),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Perform registration logic
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Register',
                              style: GoogleFonts.poppins(fontSize: 10)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
