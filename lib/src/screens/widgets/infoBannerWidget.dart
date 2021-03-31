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
                Text('Title'),
                Row(
                  children: [
                    Text('author'),
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
                Text('Comments'),
                Text('Date'),
                Text('Views'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
