import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final Function(String?) onGenderChanged;

  const GenderDropdown({Key? key, required this.onGenderChanged})
      : super(key: key);

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
            widget.onGenderChanged(newValue); // Notify parent widget
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
