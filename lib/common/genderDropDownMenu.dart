import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gender Dropdown'),
        ),
        body: Center(
          child: GenderDropdown(),
        ),
      ),
    );
  }
}

class GenderDropdown extends StatefulWidget {
  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(left: 12),
      child: DropdownButton<String>(
        value: selectedGender,
        isExpanded: true,
        dropdownColor: Colors.white,
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue;
          });
        },
        items: <String>['Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: Color.fromRGBO(135, 133, 162, 1),
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
          );
        }).toList(),
        hint: const Text(
          'Select Gender',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromRGBO(135, 133, 162, 1),
              fontSize: 14),
        ),
      ),
    );
  }
}
