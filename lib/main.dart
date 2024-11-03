import 'package:flutter/material.dart';
import 'package:new_zenith/home.dart';
import 'information.dart'; // Import the InformationPage screen
import 'login.dart'; // Import the LoginPage screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Set the initial route to /
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/login': (context) => const LoginPage(), // Route for LoginPage
        '/information': (context) =>
            const InformationPage(), // Route for InformationPage
        '/home': (context) => HomePage(), // Route for HomePage
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    // Navigate automatically to InformationPage after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/information');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 49, 2, 143), // Converted color for #31028F
              Color.fromARGB(255, 36, 190, 113), // Converted color for #24BE71
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/hero.png', // Make sure this image exists in the assets folder
                width: 550, // Set width or other properties as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
