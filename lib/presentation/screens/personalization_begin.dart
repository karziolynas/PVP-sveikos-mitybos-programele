import 'package:flutter/material.dart';
import 'package:projecthealthapp/common/auth.dart';
import 'package:projecthealthapp/presentation/screens/question_screen.dart';

class personalization_begin extends StatefulWidget {
  const personalization_begin({super.key});

  @override
  State<personalization_begin> createState() => _personalization_beginState();
}

class _personalization_beginState extends State<personalization_begin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Auth().signOut();
          },
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/personalization.png'),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                            height: 300,
                            child: Image(
                              image: AssetImage('assets/logo.png'),
                            )),
                        const Text(
                          'Thank you for joining',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromRGBO(135, 133, 162, 1),
                              fontSize: 30),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                              'Before we proceed, we would like to gather some essential health information from you through a few quick questions to ensure a personalized and effective experience with our app',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(135, 133, 162, 1),
                                  fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuestionScreen(),
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
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Your journey to a healthier you begins now',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color.fromRGBO(135, 133, 162, 1)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Click NEXT to proceed",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Color.fromRGBO(135, 133, 162, 1)),
                        )
                      ],
                    )),
              ))
            ],
          )),
    );
  }
}
