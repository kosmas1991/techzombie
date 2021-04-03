import 'package:flutter/material.dart';
import 'package:techzombie/src/models/posts.dart';

class ImageSlideWidget extends StatefulWidget {
  final MyPost allPostsRef;
  final int counter;

  ImageSlideWidget({this.allPostsRef, this.counter});

  @override
  _ImageSlideWidgetState createState() => _ImageSlideWidgetState();
}

class _ImageSlideWidgetState extends State<ImageSlideWidget>
    with TickerProviderStateMixin {
  Animation<double> arrowAnimation;
  AnimationController arrowController;

  @override
  void initState() {
    arrowController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    arrowAnimation = Tween(begin: 10.0, end: 20.0).animate(
        CurvedAnimation(parent: arrowController, curve: Curves.easeInOut));
    arrowController.forward();
    arrowAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        arrowController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        arrowController.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          buildLeftArrow(),
          buildImageField(),
          buildRightArrow(),
        ],
      ),
    );
  }

  Flexible buildRightArrow() {
    return Flexible(
        fit: FlexFit.tight,
        flex: 10,
        child: Container(
          color: Colors.black,
          child: AnimatedBuilder(
            builder: (context, child) {
              return Icon(Icons.keyboard_arrow_right,
                  color: Colors.red, size: arrowAnimation.value);
            },
            animation: arrowAnimation,
          ),
        ));
  }

  Flexible buildLeftArrow() {
    return Flexible(
        fit: FlexFit.tight,
        flex: 10,
        child: Container(
          color: Colors.black,
          child: AnimatedBuilder(
            builder: (context, child) {
              return Icon(
                Icons.keyboard_arrow_left,
                color: Colors.red,
                size: arrowAnimation.value,
              );
            },
            animation: arrowAnimation,
          ),
        ));
  }

  Flexible buildImageField() {
    return Flexible(
        fit: FlexFit.tight,
        flex: 80,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(widget.allPostsRef.posts[widget.counter]
                    .thumbnailImages['full'].url,fit: BoxFit.fill,)),
          ),
        ));
  }
}
