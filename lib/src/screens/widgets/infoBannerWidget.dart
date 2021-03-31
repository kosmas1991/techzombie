import 'package:flutter/material.dart';

class InfoBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                Row(
                  children: [
                    Text('Author', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
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
                Text('Comments', style: TextStyle(color: Colors.white),),
                Text('Date', style: TextStyle(color: Colors.white),),
                Text('Views', style: TextStyle(color: Colors.white),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
