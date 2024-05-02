import 'package:flutter/material.dart';
import 'package:projecthealthapp/presentation/screens/food_page.dart';
import 'package:projecthealthapp/presentation/screens/main_page.dart';
import 'package:projecthealthapp/presentation/screens/settings_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  List<String> selectedIngredients = [];
  void loadlist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() =>
        selectedIngredients = prefs.getStringList('selectedIngredients')!);
  }

  @override
  void initState() {
    loadlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logi.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Card(
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
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Container(
                            alignment: Alignment.center,
                            height: 400,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CalendarDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2026),
                              onDateChanged: (value) => {},
                              currentDate: DateTime.now(),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17, right: 17),
                        child: Container(
                          alignment: Alignment.center,
                          height: 275,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  'Statistics',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 19,
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Weight:',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 19,
                                          color: Color.fromRGBO(59, 59, 59, 1),
                                        ),
                                      ),
                                      Text(
                                        '70 kg',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Poppins',
                                          color:
                                              Color.fromRGBO(255, 199, 199, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Health streak:',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 19,
                                          color: Color.fromRGBO(59, 59, 59, 1),
                                        ),
                                      ),
                                      Text(
                                        '100 days',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Poppins',
                                          color:
                                              Color.fromRGBO(255, 199, 199, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Daily steps:',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 19,
                                          color: Color.fromRGBO(59, 59, 59, 1),
                                        ),
                                      ),
                                      Text(
                                        '10,000',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Poppins',
                                          color:
                                              Color.fromRGBO(255, 199, 199, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Water intake:',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 19,
                                          color: Color.fromRGBO(59, 59, 59, 1),
                                        ),
                                      ),
                                      Text(
                                        '10 cups',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Poppins',
                                          color:
                                              Color.fromRGBO(255, 199, 199, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 17, right: 17),
                        child: Container(
                          alignment: Alignment.center,
                          height: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Ingredients that you consumed',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 19,
                                    color: Color.fromRGBO(59, 59, 59, 1),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: selectedIngredients.contains('Nuts')
                                        ? const Color.fromRGBO(255, 199, 199, 1)
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Nuts',
                                      style: TextStyle(
                                          color: selectedIngredients
                                                  .contains('Nuts')
                                              ? Colors.white
                                              : const Color.fromRGBO(
                                                  135, 133, 162, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: selectedIngredients.contains('Milk')
                                        ? const Color.fromRGBO(255, 199, 199, 1)
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Milk',
                                      style: TextStyle(
                                          color: selectedIngredients
                                                  .contains('Milk')
                                              ? Colors.white
                                              : const Color.fromRGBO(
                                                  135, 133, 162, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: selectedIngredients.contains('Chicken')
                                        ? const Color.fromRGBO(255, 199, 199, 1)
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Chicken',
                                      style: TextStyle(
                                          color: selectedIngredients
                                                  .contains('Chicken')
                                              ? Colors.white
                                              : const Color.fromRGBO(
                                                  135, 133, 162, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 20),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Etc',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(135, 133, 162, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                  ),
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
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    IconButton(
                      color: const Color.fromRGBO(255, 199, 199, 1),
                      icon: const ImageIcon(
                        AssetImage('assets/diary.png'),
                      ),
                      iconSize: 28,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DiaryPage()));
                      },
                    ),
                    const Text(
                      "Diary",
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
                            AssetImage('assets/home.png'),
                          ),
                          iconSize: 28,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ));
                          }),
                      const Text(
                        "Home",
                        style: TextStyle(
                          color: Color.fromRGBO(135, 133, 162, 1),
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
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
                                builder: (context) => const FoodPage()));
                      },
                    ),
                    const Text(
                      "Food",
                      style: TextStyle(
                        color: Color.fromRGBO(135, 133, 162, 1),
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
