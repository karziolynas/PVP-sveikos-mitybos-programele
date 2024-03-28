import 'package:flutter/material.dart';
import 'package:projecthealthapp/presentation/screens/main_page.dart';

class QuestionsScreenFinal extends StatefulWidget {
  const QuestionsScreenFinal({super.key});

  @override
  State<QuestionsScreenFinal> createState() => _QuestionsScreenFinalState();
}

class _QuestionsScreenFinalState extends State<QuestionsScreenFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        const SizedBox(
                          height: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 40, left: 40),
                          child: Text(
                              'Your responses have been successfully saved, ensuring a tailored experience on your health journey with us.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(135, 133, 162, 1),
                                  fontSize: 20)),
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
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
                          height: 25,
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
