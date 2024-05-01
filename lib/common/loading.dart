import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:firebase/constants/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: SpinKitRotatingCircle(
          color:  Color.fromRGBO(255, 199, 199, 1),
          size: 50.0,
        ),
      ), // SpinkitSquareCircle ), // Center
    ); // Container
  }
}
