import 'package:flutter/material.dart';
import 'package:techzombie/src/models/posts.dart';

class ContentTextWidget extends StatefulWidget {
  final MyPost allPostsRef;
  final int counter;

  ContentTextWidget({this.allPostsRef, this.counter});

  @override
  _ContentTextWidgetState createState() => _ContentTextWidgetState();
}

class _ContentTextWidgetState extends State<ContentTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: Text(
          widget.allPostsRef.posts[widget.counter].content,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
