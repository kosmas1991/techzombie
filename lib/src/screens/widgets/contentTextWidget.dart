import 'package:flutter/material.dart';
import 'package:techzombie/src/models/posts.dart';
import 'showYoutubeFrameWidget.dart';
import 'showRegularPost.dart';

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
    String postContent = widget.allPostsRef.posts[widget.counter].content;
    bool postIsVideoPost = false;
    List<MyCategory> categoriesList =
        widget.allPostsRef.posts[widget.counter].categories;
    categoriesList.forEach((element) {
      if (element.id == 2) {
        postIsVideoPost = true;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: postIsVideoPost
            ? ShowYoutubeFrameWidget(
                id: fetchVideoId(
                    widget.allPostsRef.posts[widget.counter].content),
              )
            : ShowRegularPost(postContent: postContent,),
      ),
    );
  }

  static String fetchVideoId(String postContent) {
    List<String> lista = postContent.split(RegExp('src=\"'));
    List<String> lista2 = lista[1].split(RegExp('\\?'));
    List<String> lista3 = lista2[0].split(RegExp('\/'));
    return lista3[4];
  }

}
