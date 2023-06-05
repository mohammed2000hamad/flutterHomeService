import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_flutter/view/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/UserController.dart';
import 'HomeScreen.dart';

import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
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

  Future<void> _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      final user = await _userController.loginUser(email, password);

      if (user != null) {
        final token = user.token;

        // Save the token in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        showToast("Login successful");
        Get.off(HomeScreen());
      } else {

        print('Login failed: User is null');
        showToast("try to login again");

      }
    } catch (e) {
      // Handle login error
      print('Login failed: $e');
      showToast("Login failed : $e");

    }


  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Account Sign Up')),
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
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: rememberMe,
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value,
                            onChanged: (newValue) {
                              rememberMe.value = newValue ?? false;
                            },
                          );
                        },
                      ),
                      Text('Remember Me'),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          // Handle Forgot Password button tap
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
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
                          Text('New Member?'),
                          TextButton(
                            onPressed: () {
                              Get.off(RegisterScreen());
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          _login();

                          // Perform login logic
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 16.0),
                    child: TextButton(
                      onPressed: () {
                        Get.off(HomeScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Get Started Now',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: rememberMe,
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value,
                            onChanged: (newValue) {
                              rememberMe.value = newValue ?? false;
                            },
                          );
                        },
                      ),
                      Text('Remember Me'),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          // Handle Forgot Password button tap
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
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
                          Text('New Member?'),
                          TextButton(
                            onPressed: () {
                              // Handle Sign Up button tap
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Login button tap
                          final email = emailController.text;
                          final password = passwordController.text;
                          // Perform login logic
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Get Started Now',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                        ),
                      ],
                    ),
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
