import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 12),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/logo.png',
                            height: 58,
                            width: 78,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 17, right: 17),
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
                                  'My goals',
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
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                print('a');
                              },
                              style: ButtonStyle(
                                alignment: Alignment.centerLeft,
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(135, 133, 162, 1),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Edit profile',
                                style: TextStyle(
                                  fontFamily: 'Poppins-n',
                                  fontSize: 19,
                                  color: Color.fromRGBO(59, 59, 59, 1),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              print('a');
                            },
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(135, 133, 162, 1),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Delete account',
                              style: TextStyle(
                                fontFamily: 'Poppins-n',
                                fontSize: 19,
                                color: Color.fromRGBO(233, 68, 53, 1),
                              ),
                            )),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              print('a');
                            },
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(135, 133, 162, 1),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Change password',
                              style: TextStyle(
                                fontFamily: 'Poppins-n',
                                fontSize: 19,
                                color: Color.fromRGBO(59, 59, 59, 1),
                              ),
                            )),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              print('a');
                            },
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(135, 133, 162, 1),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Log out',
                              style: TextStyle(
                                fontFamily: 'Poppins-n',
                                fontSize: 19,
                                color: Color.fromRGBO(59, 59, 59, 1),
                              ),
                            )),
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
}
