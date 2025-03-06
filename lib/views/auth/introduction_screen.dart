import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quiz_application/views/utils/constant/app_image.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  String _status = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        bodyPadding: const EdgeInsets.all(32),
        key: _introKey,
        pages: [
          PageViewModel(
            title: "Dapat Dimainkan Di Kantor",
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("Kapan saja di kantor")],
            ),
            image: Image.asset(AppImage.introScreen1, height: 250.0),
            footer: ElevatedButton(
              onPressed: () {
                setState(() => _status = 'Going to the next page...');

                Future.delayed(
                  const Duration(seconds: 1),
                  () => _introKey.currentState?.next(),
                );
              },
              child: const Text("Let's Go!"),
            ),
          ),
          PageViewModel(
            title: "Title of custom body page",
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("Click on "), Text(" to edit a post")],
            ),
            image: Image.asset(AppImage.introScreen2, height: 250.0),
            footer: ElevatedButton(
              onPressed: () {
                setState(() => _status = 'Going to the next page...');

                Future.delayed(
                  const Duration(seconds: 1),
                  () => _introKey.currentState?.next(),
                );
              },
              child: const Text("Let's Go!"),
            ),
          ),
        ],
        showBackButton: false,
        showNextButton: false,
        showDoneButton: false,
      ),
    );
  }
}
