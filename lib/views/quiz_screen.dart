import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_application/views/utils/constant/app_color.dart';
import 'package:quiz_application/views/auth/login_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.name});
  final String name;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final TextEditingController _nameController = TextEditingController();
  int _selectedOption = -1; // Jawaban yang dipilih
  int _timer = 30; // Timer awal
  late Timer _countdownTimer; // Timer countdown

  final List<String> options = ["2000", "2025", "2023", "2024"];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // Fungsi untuk memulai timer
  void startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timer > 0) {
        setState(() {
          _timer--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            // Header dengan Previous & 7/10 menggunakan Expanded
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        LoginScreen(name: _nameController.text);
                      }, // Fungsi untuk kembali
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColor.secondColor,
                          ),
                          SizedBox(width: 5),
                          const Text(
                            "Previous",
                            style: TextStyle(
                              color: AppColor.secondColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: const Text(
                      "7/10",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ), // Placeholder untuk keseimbangan layout
              ],
            ),
            const SizedBox(height: 20),

            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Box soal
                Container(
                  width: double.infinity,
                  height: 229,
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: -10,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Tahun berapa saat ini?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Timer (ditempatkan di atas kotak soal)
                Positioned(
                  top: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 86,
                        height: 86,
                        child: CircularProgressIndicator(
                          value: _timer / 30,
                          backgroundColor: Color(0xffABD1C6),
                          color: Color(0xff004643),
                          strokeWidth: 8,
                        ),
                      ),
                      Text(
                        "$_timer",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // List Jawaban (Radio Buttons)
            Column(
              children:
                  options.asMap().entries.map((entry) {
                    int index = entry.key;
                    String value = entry.value;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOption = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _selectedOption == index
                                  ? Colors.teal.withOpacity(0.2)
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                _selectedOption == index
                                    ? Colors.teal
                                    : Colors.grey[300]!,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Radio<int>(
                              value: index,
                              groupValue: _selectedOption,
                              activeColor: Colors.teal,
                              onChanged: (int? newIndex) {
                                setState(() {
                                  _selectedOption = newIndex!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),

            // Tombol Next
            ElevatedButton(
              onPressed: _selectedOption == -1 ? null : () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                disabledBackgroundColor: Colors.grey[400],
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
