import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.name});
  final String name;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 75),
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
