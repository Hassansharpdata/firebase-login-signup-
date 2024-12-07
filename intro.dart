import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'dart:developer';

class IntroView extends StatefulWidget {
  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    // Adding slides to the list
    listContentConfig = [
      ContentConfig(
        backgroundColor: const Color(0xfff),
        widgetTitle: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/intro-img.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "View and buy Medicine online",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      ContentConfig(
        backgroundColor: const Color(0xff153ca5),
        widgetTitle: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/intro-img.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "View and buy Medicine online",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      ContentConfig(
        backgroundColor: Colors.white,
        widgetTitle: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/intro-img.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "View and buy Medicine online",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  void onDonePress() {
    log("End of slides");
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        listContentConfig: listContentConfig,
        onDonePress: onDonePress,
      ),
    );
  }
}
