import 'package:flutter/material.dart';
import 'package:kawach/repository/screen/register/signupscreen.dart';

import 'loginscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isNewUser = true; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // black background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Text
              const Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 50),

              // Toggle Buttons (New User | Old User)
              Container(
                height:50,
                width:350,
                decoration: BoxDecoration(
                  color: Colors.white, // border background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // New User Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isNewUser = true;
                        });
                        // Navigate to Sign Up screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SignUpScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height:50,
                        width:175,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: isNewUser ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "New User",
                          style: TextStyle(
                            color:
                            isNewUser ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),

                    // Old User Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isNewUser = false;
                        });
                        // Navigate to Login screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                          width:175,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: !isNewUser ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Old User",
                          style: TextStyle(
                            color:
                            !isNewUser ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
