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
                      backgroundImage: NetworkImage('https://el.gravatar.com/avatar/ba6ba349f322f9e75c4dd9cdeb6a0f3a#038;r=g&#038;d=monsterid'),
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
