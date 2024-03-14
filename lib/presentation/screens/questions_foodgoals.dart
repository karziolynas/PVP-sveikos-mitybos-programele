import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:projecthealthapp/common/databaseService.dart';
import 'package:projecthealthapp/presentation/screens/questions_timespent.dart';

class QuestionsFoodGoals extends StatefulWidget {
  const QuestionsFoodGoals({Key? key}) : super(key: key);

  @override
  State<QuestionsFoodGoals> createState() => _QuestionsFoodGoalsState();
}

class _QuestionsFoodGoalsState extends State<QuestionsFoodGoals> {
  List<String> selectedGoals = [];

  void handleButtonPress(int index) {
    setState(() {
      String goal = [
        'Weight loss',
        'Disease prevention, immune system strenghtening',
        'Daily healthy food choices',
      ][index];

      if (selectedGoals.contains(goal)) {
        selectedGoals.remove(goal);
      } else {
        selectedGoals.add(goal);
      }
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
                          'Food goals:',
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
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SizedBox(
                            height: 55,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                handleButtonPress(i);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedGoals.contains([
                                  'Weight loss',
                                  'Disease prevention, immune system strenghtening',
                                  'Daily healthy food choices',
                                ][i])
                                    ? const Color.fromRGBO(135, 133, 162, 1)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                [
                                  'Weight loss',
                                  'Disease prevention, immune system strenghtening',
                                  'Daily healthy food choices',
                                ][i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: selectedGoals.contains([
                                    'Weight loss',
                                    'Disease prevention, immune system strenghtening',
                                    'Daily healthy food choices',
                                  ][i])
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
                            addGoals();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const QuestionsTimeSpent(),
                              ),
                            );
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

  Future<void> addGoals() async {
    try {
      await DatabaseService().addGoals(goals: selectedGoals);
    } catch (error) {
      print(error);
    }
  }
}
