import 'package:flutter/material.dart';
import 'package:projecthealthapp/common/databaseService.dart';
import 'package:projecthealthapp/presentation/screens/questions_problems.dart';

class QuestionsScreenTwo extends StatefulWidget {
  const QuestionsScreenTwo({Key? key}) : super(key: key);

  @override
  State<QuestionsScreenTwo> createState() => _QuestionsScreenTwoState();
}

class _QuestionsScreenTwoState extends State<QuestionsScreenTwo> {
  int selectedIndex = -1;
  bool canClickNext = false;

  String selectedPreference = '';

  void handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
      canClickNext = true;

      List<String> preferences = [
        'Vegetarian',
        'Vegan',
        'Traditional',
        'Healthy / balanced diet',
        'Sports diet'
      ];

      selectedPreference = preferences[index];
    });
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
                      const SizedBox(
                        height: 130,
                        child: Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Image(
                            image: AssetImage('assets/logo.png'),
                            height: 58,
                            width: 78,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'Food preference',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 27,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                handleButtonPress(i);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedIndex == i
                                    ? const Color.fromRGBO(135, 133, 162, 1)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                [
                                  'Vegetarian',
                                  'Vegan',
                                  'Traditional',
                                  'Healthy / balanced diet',
                                  'Sports diet'
                                ][i],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: selectedIndex == i
                                      ? Colors.white
                                      : const Color.fromRGBO(135, 133, 162, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            if (canClickNext) {
                              addPreference();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const QuestionsProblems(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(135, 133, 162, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'NEXT',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Please select your food preference',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Color.fromRGBO(135, 133, 162, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Click NEXT to proceed",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Color.fromRGBO(135, 133, 162, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addPreference() async {
    try {
      await DatabaseService().addPreference(preference: selectedPreference);
    } catch (error) {
      print(error);
    }
  }
}
