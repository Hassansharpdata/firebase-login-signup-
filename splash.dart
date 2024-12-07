import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    // Navigate to login screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/intro'); // Navigate to login
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.loose, // Makes the background image fit the entire screen
        children: [
          // Background Image
          Image.asset(
            'assets/images/bg.jpg',
            colorBlendMode: BlendMode.overlay,
            color: Colors.black12,
            fit: BoxFit.cover, // Cover the screen with the image
            height: height,
            // height: MediaQuery.of(context).size.height,
          ),
          // Login Button in Center
          // Center(
          //   child: Image.asset('assets/images/logo.png'),
          // ),
          Positioned(
            top: height / 2.5,
            left: width / 6,
            child: Image.asset('assets/images/medical-logo.png'),
          )
        ],
      ),
    );
  }
}
