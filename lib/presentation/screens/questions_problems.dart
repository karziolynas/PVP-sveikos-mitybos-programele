import 'package:flutter/material.dart';
import 'package:projecthealthapp/common/databaseService.dart';
import 'package:projecthealthapp/presentation/screens/questions_foodgoals.dart';

class QuestionsProblems extends StatefulWidget {
  const QuestionsProblems({Key? key}) : super(key: key);

  @override
  State<QuestionsProblems> createState() => _QuestionsProblemsState();
}

class _QuestionsProblemsState extends State<QuestionsProblems> {
  List<String> selectedHealthProblems = [];

  void handleButtonPress(int index) {
    setState(() {
      String problem = [
        'Overweight, obesity',
        'Heart diseases',
        'Type 2 diabetes',
        'Iron deficiency',
        'Iodine deficiency',
        'Vitamin D deficiency',
        'Calcium deficiency',
        'Vitamin A deficiency',
        'Magnesium deficiency',
        'Digestive problems',
      ][index];

      // Toggle the selected health problem
      if (selectedHealthProblems.contains(problem)) {
        selectedHealthProblems.remove(problem);
      } else {
        selectedHealthProblems.add(problem);
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
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'Health problems:',
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
                      for (int i = 0; i < 10; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: ElevatedButton(
                              onPressed: () {
                                handleButtonPress(i);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    selectedHealthProblems.contains([
                                  'Overweight, obesity',
                                  'Heart diseases',
                                  'Type 2 diabetes',
                                  'Iron deficiency',
                                  'Iodine deficiency',
                                  'Vitamin D deficiency',
                                  'Calcium deficiency',
                                  'Vitamin A deficiency',
                                  'Magnesium deficiency',
                                  'Digestive problems',
                                ][i])
                                        ? const Color.fromRGBO(135, 133, 162, 1)
                                        : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                [
                                  'Overweight, obesity',
                                  'Heart diseases',
                                  'Type 2 diabetes',
                                  'Iron deficiency',
                                  'Iodine deficiency',
                                  'Vitamin D deficiency',
                                  'Calcium deficiency',
                                  'Vitamin A deficiency',
                                  'Magnesium deficiency',
                                  'Digestive problems',
                                ][i],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: selectedHealthProblems.contains([
                                    'Overweight, obesity',
                                    'Heart diseases',
                                    'Type 2 diabetes',
                                    'Iron deficiency',
                                    'Iodine deficiency',
                                    'Vitamin D deficiency',
                                    'Calcium deficiency',
                                    'Vitamin A deficiency',
                                    'Magnesium deficiency',
                                    'Digestive problems',
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
                            addHealthProblems();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const QuestionsFoodGoals(),
                                //TODO
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

  Future<void> addHealthProblems() async {
    try {
      await DatabaseService()
          .addHealthProblems(healthProblems: selectedHealthProblems);
    } catch (error) {
      print(error);
    }
  }
}
