import 'package:flutter/material.dart';

class ImageSlideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(flex: 1,child: Container(color: Colors.deepPurple,)),
          Flexible(flex: 8,child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Container(color: Colors.grey,),
          )),
          Flexible(flex: 1,child: Container(color: Colors.deepPurple,))
        ],
      ),),
    );
  }
}
