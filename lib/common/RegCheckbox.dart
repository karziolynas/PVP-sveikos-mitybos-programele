import 'package:flutter/material.dart';

class RegCheckbox extends StatefulWidget {
  const RegCheckbox({super.key, required this.onChanged});
  final Function(bool) onChanged;

  @override
  State<RegCheckbox> createState() => _RegCheckboxState();
}

class _RegCheckboxState extends State<RegCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Color.fromRGBO(135, 133, 162, 1),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.onChanged(isChecked);
        });
      },
    );
  }
}
