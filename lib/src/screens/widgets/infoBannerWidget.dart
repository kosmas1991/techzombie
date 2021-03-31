import 'package:flutter/material.dart';

class InfoBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text('Author'),
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                    )
                  ],
                ),
                Text('Views')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Date'),
                Text('Comments')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
