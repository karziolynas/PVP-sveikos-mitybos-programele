import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Container(
        height: 200, // Set a fixed height to avoid layout issues
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
