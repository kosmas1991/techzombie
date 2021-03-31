import 'package:flutter/material.dart';

class InfoBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                Row(
                  children: [
                    Text('Author', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Comments', style: TextStyle(color: Colors.red),),
                Text('Date', style: TextStyle(color: Colors.red),),
                Text('Views', style: TextStyle(color: Colors.red),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
