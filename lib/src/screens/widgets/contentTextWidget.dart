import 'package:flutter/material.dart';

class ContentTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: Text(
          'Content text here Content text here Content text here Content text here Content text here Content text here Content text here Content text here Content text here Content text here ',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
