import 'package:flutter/material.dart';
import 'package:kawach/repository/screen/complaint/grievancescreen.dart';
import 'package:kawach/repository/screen/complaint/trackcomplaintscreen.dart';
import 'package:kawach/repository/screen/learnmore/learnmorescreen.dart';
import 'package:kawach/repository/screen/personalise/personalizationscreen.dart';
import 'package:kawach/repository/screen/profile/accountscreen.dart';
import 'package:kawach/repository/screen/supporthelp/supporthelpscreen.dart';

// Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // App name
              const Text(
                "KAVACH",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // Profile Section title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile Section",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Buttons
              buildProfileButton(
                  context,
                  "Account",
                  AccountScreen()
              ),
              buildProfileButton(
                  context,
                  "Track your Complaint",
                  TrackComplaintScreen()
              ),
              buildProfileButton(
                  context,
                  "Learn More",
                  LearnMoreScreen()
              ),
              buildProfileButton(
                  context, "Personalization", PersonalizationScreen()),
              buildProfileButton(
                  context, "Support & Help", SupportHelpScreen()),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable button widget
  Widget buildProfileButton(
      BuildContext context, String title, Widget nextScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Custom left-to-right transition
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (context, animation, secondaryAnimation) =>
                nextScreen,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final offsetAnimation = Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ));
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

