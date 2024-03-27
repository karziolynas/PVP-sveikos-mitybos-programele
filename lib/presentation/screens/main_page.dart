import 'package:flutter/material.dart';
import 'package:projecthealthapp/common/auth.dart';

import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projecthealthapp/presentation/screens/diary_page.dart';
import 'package:projecthealthapp/presentation/screens/food_page.dart';
import 'package:projecthealthapp/presentation/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _count = 0;

  late Stream<StepCount> _stepCountStream;
  int _steps = -1;
  double _percnt = 0.0;
  final stepsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps;
      _percnt = (_steps * 1.0) / 8000.0;
      stepsController.text = _steps.toString();
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = -2;
      stepsController.text = "ERR";
    });
  }

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Card(
                        child: Container(
                          width: 381,
                          height: 68,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/logo.png',
                                height: 58,
                                width: 78,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Hello, Name',
                                style: TextStyle(
                                  color: Color.fromRGBO(30, 30, 30, 1),
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Poppins-n',
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.logout),
                                onPressed: () {
                                  Auth().signOut();
                                },
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const ImageIcon(
                                  AssetImage('assets/settings_icon.png'),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SettingsScreen()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 355,
                      height: 218,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Today's calorie goal:",
                            style: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins',
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "2000 kcal",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 199, 199, 1),
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins',
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            "Health Streak:",
                            style: TextStyle(
                              color: Color.fromRGBO(59, 59, 59, 1),
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins',
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "10 days",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 199, 199, 1),
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins',
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 355,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        Image.asset(
                          'assets/sakutes.png',
                          height: 58,
                          width: 78,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Food suggestions",
                              style: TextStyle(
                                color: Color.fromRGBO(59, 59, 59, 1),
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Check out the daily recipes",
                              style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Image.asset(
                          'assets/plus.png',
                          height: 58,
                          width: 78,
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 170,
                          height: 153,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    color:
                                        const Color.fromRGBO(255, 199, 199, 1),
                                    icon: const ImageIcon(
                                      AssetImage('assets/minus.png'),
                                    ),
                                    iconSize: 20,
                                    onPressed: () => {
                                      if (_count >= 1)
                                        {setState(() => _count--)}
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Image.asset(
                                    'assets/cup.png',
                                    height: 60,
                                    width: 45,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  IconButton(
                                    color:
                                        const Color.fromRGBO(255, 199, 199, 1),
                                    icon: const ImageIcon(
                                      AssetImage('assets/plus.png'),
                                    ),
                                    iconSize: 23,
                                    onPressed: () => setState(() => _count++),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$_count',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(59, 59, 59, 1),
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Poppins-n',
                                      fontSize: 30,
                                    ),
                                  ),
                                  const Text(
                                    "Daily Water Intake",
                                    style: TextStyle(
                                      color: Color.fromRGBO(59, 59, 59, 1),
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'Poppins-n',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          width: 170,
                          height: 153,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                        child: CircularPercentIndicator(
                                      radius: 50.0,
                                      lineWidth: 15.0,
                                      animation: true,
                                      percent: _percnt,
                                      center: Text(
                                        stepsController.text,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(59, 59, 59, 1),
                                          fontWeight: FontWeight.w100,
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                        ),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      backgroundColor: const Color.fromRGBO(
                                          230, 230, 230, 1),
                                      progressColor: const Color.fromRGBO(
                                          255, 199, 199, 1),
                                    )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Steps Walked",
                                      style: TextStyle(
                                        color: Color.fromRGBO(59, 59, 59, 1),
                                        fontWeight: FontWeight.w100,
                                        fontFamily: 'Poppins-n',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 355,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        Image.asset(
                          'assets/sakutes.png',
                          height: 58,
                          width: 78,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "70 kg",
                              style: TextStyle(
                                color: Color.fromRGBO(59, 59, 59, 1),
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "You have a healthy BMI",
                              style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'assets/plus.png',
                          height: 58,
                          width: 78,
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [
                          IconButton(
                            color: const Color.fromRGBO(135, 133, 162, 1),
                            icon: const ImageIcon(
                              AssetImage('assets/diary.png'),
                            ),
                            iconSize: 28,
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DiaryPage()))
                            },
                          ),
                          const Text(
                            "Diary",
                            style: TextStyle(
                              color: Color.fromRGBO(135, 133, 162, 1),
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ]),
                        Column(children: [
                          IconButton(
                            color: const Color.fromRGBO(255, 199, 199, 1),
                            icon: const ImageIcon(
                              AssetImage('assets/home.png'),
                            ),
                            iconSize: 28,
                            onPressed: () => print('home pressed'),
                          ),
                          const Text(
                            "Home",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 199, 199, 1),
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ]),
                        Column(
                          children: [
                            IconButton(
                                color: const Color.fromRGBO(135, 133, 162, 1),
                                icon: const ImageIcon(
                                  AssetImage('assets/food.png'),
                                ),
                                iconSize: 28,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const FoodPage(),
                                      ));
                                }),
                            const Text(
                              "Food",
                              style: TextStyle(
                                color: Color.fromRGBO(135, 133, 162, 1),
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
