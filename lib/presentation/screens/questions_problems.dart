import 'package:flutter/material.dart';
import 'package:projecthealthapp/presentation/screens/questions_foodgoals.dart';

class QuestionsProblems extends StatefulWidget {
  const QuestionsProblems({Key? key}) : super(key: key);

  @override
  State<QuestionsProblems> createState() => _QuestionsProblemsState();
}

class _QuestionsProblemsState extends State<QuestionsProblems> {
  List selectedIndex = [];

  void handleButtonPress(int index) {
    if (selectedIndex.contains(index) == false) {
      setState(() {
        selectedIndex.add(index);
      });
    } else if (selectedIndex.contains(index)) {
      setState(() {
        selectedIndex.remove(index);
      });
    }
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
                                backgroundColor: selectedIndex.contains(i)
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
                                  color: selectedIndex.contains(i)
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionsFoodGoals(),
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
}
