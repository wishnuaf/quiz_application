import 'package:flutter/material.dart';
import 'package:quiz_application/service/pref_handler.dart';
import 'package:quiz_application/views/utils/constant/app_color.dart';
import 'package:quiz_application/views/utils/constant/app_image.dart';
import 'package:quiz_application/views/quiz_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.name});
  final String name;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();

  bool _isActive = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            AppImage.bgLoginScreen,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 173),
                  Image.asset(
                    AppImage.logo,
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 190),
                  Column(
                    children: [
                      SizedBox(height: 120),

                      titleField("Enter your name"),

                      SizedBox(height: 10),

                      textFieldConst(
                        hintText: "John Deh...",
                        controller: _nameController,
                        validator: (hintText) {
                          if (hintText == null || hintText.isEmpty) {
                            return "Nama Belum Di Isi";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 238),

                  InkWell(
                    onTap:
                        _isActive
                            ? () async {
                              PreferenceHandler.saveId(_nameController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => QuizScreen(
                                        name: _nameController.text,
                                      ),
                                ),
                              );
                            }
                            : null,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 59,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Start',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 24,
                              fontFamily: 'Baloo_2',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldConst({
    String? hintText,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) => TextFormField(
    onChanged: (value) {
      if (controller.text.length > 5) {
        setState(() {
          _isActive = true;
        });
      } else {
        setState(() {
          _isActive = false;
        });
      }
    },

    controller: controller,
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 12,
        color: Color(0xFFE9EAED),
        fontFamily: 'Baloo_2',
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );

  Widget titleField(String text) => Row(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFFEEEFF2),
          fontFamily: 'Baloo_2',
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
