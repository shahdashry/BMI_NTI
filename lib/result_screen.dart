// ```dart
import 'package:bmi/home_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  static String routeName = 'ResultScreen';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as BmiModel;

    return Scaffold(
      backgroundColor: const Color(0xFF1C2135),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2135),
        elevation: 0,
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 20),

            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),

                width: double.infinity,

                padding: const EdgeInsets.symmetric(horizontal: 35),

                decoration: BoxDecoration(
                  color: const Color(0xFF333244),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  children: [
                    const SizedBox(height: 60),

                    Text(
                      arg.resultBmi(),

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: arg.categoryColor(),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      arg.calculateBmi().toString(),

                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 60),

                    Text(
                      arg.healthAdvice(),

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),

                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },

        padding: const EdgeInsets.all(30),

        color: const Color(0xFF3D81E8),

        child: const Text(
          "Re - Calculate",

          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
