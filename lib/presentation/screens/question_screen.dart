import 'package:flutter/material.dart';
import 'package:projecthealthapp/common/databaseService.dart';
import 'package:projecthealthapp/common/genderDropDownMenu.dart';
import 'package:projecthealthapp/presentation/screens/questions_screen_two.dart';
import 'package:intl/intl.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? selectedGender; // To store selected gender
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _date = TextEditingController();

  @override
  void dispose() {
    _birthDateController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    if (_date.text.isEmpty ||
        selectedGender == null ||
        _heightController.text.isEmpty ||
        _weightController.text.isEmpty) {
      return false;
    }
    if (double.tryParse(_heightController.text) == null ||
        double.tryParse(_weightController.text) == null) {
      return false;
    }
    final height = double.parse(_heightController.text);
    final weight = double.parse(_weightController.text);
    if (height <= 0 || height > 300 || weight <= 0 || weight > 300) {
      return false;
    }
    return true;
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
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          'General questions',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 27,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.only(right: 140, bottom: 10),
                        child: Text(
                          'Select your birth date:',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(135, 133, 162, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 300,
                        child: TextFormField(
                          controller: _date,
                          keyboardType: TextInputType.datetime,
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                            if (pickeddate != null) {
                              setState(() {
                                _date.text =
                                    DateFormat('yyyy-MM-dd').format(pickeddate);
                              });
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '',
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.only(right: 150, bottom: 10),
                        child: Text(
                          'Enter your height:     ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(135, 133, 162, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 300,
                        child: TextFormField(
                          controller: _heightController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your height';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '',
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.only(right: 150, bottom: 10),
                        child: Text(
                          'Enter your weight:     ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(135, 133, 162, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 300,
                        child: TextFormField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '',
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.only(right: 150, bottom: 10),
                        child: Text(
                          'Select your gender:    ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(135, 133, 162, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 300,
                        child: GenderDropdown(
                          onGenderChanged: (gender) {
                            setState(() {
                              selectedGender = gender;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 100),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: _validateFields()
                              ? () {
                                  addGeneralQuestionsToUserData();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const QuestionsScreenTwo(),
                                    ),
                                  );
                                }
                              : null,
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
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Please enter the given prompts',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Color.fromRGBO(135, 133, 162, 1),
                        ),
                      ),
                      const SizedBox(height: 15),
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
            )
          ],
        ),
      ),
    );
  }

  Future<void> addGeneralQuestionsToUserData() async {
    try {
      await DatabaseService().addGeneralQuestions(
          birthDate: _date.text,
          gender: selectedGender!,
          height: _heightController.text,
          weight: _weightController.text);
    } catch (error) {
      print(error);
    }
  }
}
