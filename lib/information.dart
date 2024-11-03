import 'package:flutter/material.dart';
import 'dart:ui'; // Import this to use ImageFilter

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  int _currentIndex = 0; // Track the current index for the indicators

  void _nextPage() {
    setState(() {
      if (_currentIndex < 2) {
        _currentIndex++; // Move to the next indicator
      } else {
        // Navigate to the login page if on the last screen
        Navigator.pushReplacementNamed(
            context, '/login'); // Assuming '/login' route is set in main.dart
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define the different texts based on the _currentIndex value
    final List<String> messages = [
      'Welcome!',
      'Second Information',
      'Third Information'
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 49, 2, 143),
              Color.fromARGB(255, 36, 190, 113),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Logo and title
            Image.asset(
              'assets/hero.png', // Make sure this image exists in the assets folder
              width: 350,
            ),
            const Spacer(),
            // Display dynamic message
            Column(
              children: [
                Text(
                  messages[_currentIndex],
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dolor libero, faucibus a nisl eget, bibendum pretium tortor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Progress indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentIndex == index ? Colors.white : Colors.white38,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: _currentIndex != 2 // Check if the index is not equal to 2
                  ? GestureDetector(
                      onTap: _nextPage,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _currentIndex == 2
                                ? Icons.check
                                : Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _currentIndex == 2 ? 'Get Started' : 'Next',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(), // Return an empty Container when _currentIndex == 2
            ),

            // Next or Get Started button
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: _currentIndex == 2 // Check if the index is equal to 2
                  ? GestureDetector(
                      onTap: _nextPage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            30.0), // Ensure rounded corners are applied
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 2.0, sigmaY: 2.0), // Set the blur effect
                          child: Container(
                            width: 300, // Set a fixed width
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                  0.6), // Set the background color with opacity
                              borderRadius: BorderRadius.circular(
                                  30.0), // Set rounded corners
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 66, 10, 150), // Changed to #420A96
                                // Set the border color
                                width: 1.0, // Set the border width
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 20.0), // Padding inside the button
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons
                                      .check, // Show check icon when index is 2
                                  color: const Color.fromARGB(
                                      255, 66, 10, 150), // Changed to #420A96
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Get Started', // Show 'Get Started' text when index is 2
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(
                                        255, 66, 10, 150), // Changed to #420A96
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(), // Return an empty Container when _currentIndex is not 2
            ),
          ],
        ),
      ),
    );
  }
}
