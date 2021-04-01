import 'package:flutter/material.dart';
import 'package:techzombie/src/models/posts.dart';

class InfoBannerWidget extends StatefulWidget {
  final MyPost allPostsRef;
  final int counter;
  InfoBannerWidget({this.allPostsRef,this.counter});
  @override
  _InfoBannerWidgetState createState() => _InfoBannerWidgetState();
}

class _InfoBannerWidgetState extends State<InfoBannerWidget> {
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
                Row(
                  children: [
                    Text('Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Container(width: MediaQuery.of(context).size.width*0.6,child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.allPostsRef.posts[widget.counter].title, maxLines: 3,style: TextStyle(color: Colors.red),),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Text('Author', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage('https://el.gravatar.com/avatar/ba6ba349f322f9e75c4dd9cdeb6a0f3a#038;r=g&#038;d=monsterid'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Comments', style: TextStyle(color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.allPostsRef.posts[widget.counter].commentCount.toString(),style: TextStyle(color: Colors.red),),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(widget.allPostsRef.posts[widget.counter].date.year.toString() + '.', style: TextStyle(color: Colors.red),),
                    Text(widget.allPostsRef.posts[widget.counter].date.month.toString() + '.', style: TextStyle(color: Colors.red),),
                    Text(widget.allPostsRef.posts[widget.counter].date.day.toString(), style: TextStyle(color: Colors.red),),
                  ],
                ),
                Row(
                  children: [
                    Text('Views', style: TextStyle(color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.allPostsRef.posts[widget.counter].customFields.views.toString(),style: TextStyle(color: Colors.red),),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
