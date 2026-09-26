import 'dart:math';

import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = true;
  bool isFemale = true;

  double hight = 165;
  int weigth = 50;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Switch(
          value: isDarkMode,
          onChanged: (value) {
            setState(() {
              isDarkMode = value;
            });
          },
        ),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // =========================
            // Male & Female
            // =========================

            Expanded(
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ContainerWidget(
                    imagePath: "assets/images/male.png",
                    title: "Male",
                    isSelected: isFemale == false,
                    onTap: () {
                      setState(() {
                        isFemale = false;
                      });
                    },
                  ),

                  ContainerWidget(
                    imagePath: "assets/images/female.png",
                    title: "Female",
                    isSelected: isFemale == true,
                    onTap: () {
                      setState(() {
                        isFemale = true;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // =========================
            // Height
            // =========================
            Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: const Color(0xFF333244),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Height",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    Text.rich(
                      TextSpan(
                        text: hight.round().toString(),

                        style: Theme.of(context).textTheme.bodyLarge,

                        children: [
                          TextSpan(
                            text: " cm",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                    ),

                    Slider(
                      value: hight,
                      min: 100,
                      max: 200,

                      onChanged: (value) {
                        setState(() {
                          hight = value;
                        });
                      },

                      activeColor: const Color(0xFF3D81E8),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // Weight & Age
            // =========================
            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  WeightWidget(
                    text: "Weight",
                    num: weigth,

                    addOnPressed: () {
                      setState(() {
                        weigth++;
                      });
                    },

                    removeOnPressed: () {
                      if (weigth > 0) {
                        setState(() {
                          weigth--;
                        });
                      }
                    },
                  ),

                  WeightWidget(
                    text: "Age",
                    num: age,

                    addOnPressed: () {
                      setState(() {
                        age++;
                      });
                    },

                    removeOnPressed: () {
                      if (age > 0) {
                        setState(() {
                          age--;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),

      // =========================
      // Calculate Button
      // =========================
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          var bmiModel = BmiModel(
            isFemale: isFemale,
            hight: hight,
            weigth: weigth,
            age: age,
          );

          Navigator.of(context)
              .pushNamed(ResultScreen.routeName, arguments: bmiModel);
        },

        padding: const EdgeInsets.all(30),

        color: const Color(0xFF3D81E8),

        child: const Text(
          "Calculate",
          style: TextStyle(fontSize: 32, color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}

// =====================================================
// Male / Female Widget
// =====================================================

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final String imagePath;
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,

        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),

          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF24263B)
                : const Color(0xFF333244),

            borderRadius: BorderRadius.circular(12),

            border: Border.all(
              color: isSelected
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF333244),
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              // الصورة بحجم ثابت
              SizedBox(
                width: 70,
                height: 70,

                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),

              // Male / Female
              Text(title, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// Weight / Age Widget
// =====================================================

class WeightWidget extends StatelessWidget {
  const WeightWidget({
    super.key,
    required this.text,
    required this.num,
    required this.addOnPressed,
    required this.removeOnPressed,
  });

  final String text;
  final int num;
  final void Function()? addOnPressed;
  final void Function()? removeOnPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF333244),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            // Weight / Age
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),

            // الرقم
            Text(
              num.toString(),
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),

            // + و -
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                FloatingActionButton(
                  onPressed: addOnPressed,

                  backgroundColor: const Color(0xFF8B8C9E),

                  shape: const CircleBorder(),

                  child: const Icon(
                    Icons.add,
                    color: Color(0xFFFFFFFF),
                    size: 32,
                  ),
                ),

                FloatingActionButton(
                  onPressed: removeOnPressed,

                  backgroundColor: const Color(0xFF8B8C9E),

                  shape: const CircleBorder(),

                  child: const Icon(
                    Icons.remove,
                    color: Color(0xFFFFFFFF),
                    size: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// BMI Model
// =====================================================

class BmiModel {
  bool isFemale;
  double hight;
  int weigth;
  int age;

  BmiModel({
    required this.isFemale,
    required this.hight,
    required this.weigth,
    required this.age,
  });

  // حساب BMI
  double calculateBmi() {
    return (weigth / pow(hight / 100, 2)).roundToDouble();
  }

  // نتيجة BMI
  String resultBmi() {
    if (calculateBmi() < 18.5) {
      return 'Underweight';
    } else if (calculateBmi() < 25) {
      return 'Normal';
    } else if (calculateBmi() < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  // النصيحة الصحية
  String healthAdvice() {
    switch (resultBmi()) {
      case 'Underweight':
        return 'Consider consulting a healthcare provider about healthy weight gain strategies.';

      case 'Normal':
        return 'Great! Maintain your current lifestyle with balanced diet and regular exercise.';

      case 'Overweight':
        return 'Consider a balanced diet and increased physical activity to reach a healthier weight.';

      case 'Obese':
        return 'Consult with a healthcare provider for a personalized weight management plan.';

      default:
        return 'Consult with a healthcare provider for personalized advice.';
    }
  }

  // لون النتيجة
  Color categoryColor() {
    switch (resultBmi()) {
      case 'Underweight':
        return const Color(0xFF3F51B5);

      case 'Normal':
        return const Color(0xFF4CAF50);

      case 'Overweight':
        return const Color(0xFFFF9800);

      case 'Obese':
        return const Color(0xFFF44336);

      default:
        return const Color(0xFF9E9E9E);
    }
  }
}
