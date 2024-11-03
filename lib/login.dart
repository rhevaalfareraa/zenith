import 'package:flutter/material.dart';
import 'dart:ui';

// import 'package:new_zenith/home.dart'; // Import this to use ImageFilter

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false; // Checkbox state
  final TextEditingController _phoneController =
      TextEditingController(); // Controller for phone number input

  void _onSignInPressed() {
    if (_isChecked && _phoneController.text.isNotEmpty) {
      // Perform navigation or login functionality here
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Show a warning message if terms are not accepted
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please agree to the Terms and Conditions"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 49, 2, 143), // Dark purple
              Color.fromARGB(255, 36, 190, 113), // Green
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Icon/Image placeholder
            Image.asset(
              'assets/Illustration.png', // Make sure this image exists in the assets folder
              width: 350, // Set width or other properties as needed
            ),
            const SizedBox(height: 20),

            // Sign In Text
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            // Phone Number Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixText: '+62 ',
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Terms and Conditions Checkbox
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  const Expanded(
                    child: Text(
                      'By creating an account you agree to our '
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Sign In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: GestureDetector(
                onTap: _onSignInPressed, // Use GestureDetector to capture taps
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2.0, sigmaY: 2.0), // Blur effect
                    child: Container(
                      width: double.infinity, // Full width of the parent
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.6), // Background color with opacity
                        borderRadius:
                            BorderRadius.circular(30.0), // Rounded corners
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 66, 10, 150), // Border color #420A96
                          width: 1.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0), // Vertical padding
                      child: const Center(
                        child: Text(
                          'Sign In with Your Zenith.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 66, 10, 150),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
