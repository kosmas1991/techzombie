import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techzombie/src/models/posts.dart';
import 'widgets/imageSlideWidget.dart';
import 'widgets/infoBannerWidget.dart';
import 'widgets/contentTextWidget.dart';
import 'loadingScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyPost _allPostsRef;
  int _counter = 0;
  bool _loading = true;

  @override
  void initState() {
    MyPost.getAllPosts().then((value) {
      setState(() {
        _allPostsRef = value;
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light));

    return SafeArea(
      child: _loading
          ? LoadingScreen()
          : GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity > 8) {
                  setState(() {
                    _counter--;
                    if (_counter == -1) {
                      _counter = _allPostsRef.posts.length - 1;
                    }
                  });
                } else if (details.primaryVelocity < -8) {
                  setState(() {
                    _counter++;
                    if (_counter == _allPostsRef.posts.length) {
                      _counter = 0;
                    }
                  });
                }
              },
              child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.black,
                    title: Center(
                      child: Image.asset(
                        'assets/techzombie_logo.jpg',
                        height: 45,
                        fit: BoxFit.contain,
                      ),
                    )),
                body: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 27,
                          child: Container(
                            color: Colors.black,
                            child: ImageSlideWidget(
                              allPostsRef: _allPostsRef,
                              counter: _counter,
                            ),
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 13,
                          child: Container(
                            color: Colors.black,
                            child: InfoBannerWidget(
                              allPostsRef: _allPostsRef,
                              counter: _counter,
                            ),
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 60,
                          child: Container(
                            color: Colors.black,
                            child: ContentTextWidget(
                              allPostsRef: _allPostsRef,
                              counter: _counter,
                            ),
                          )),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      _counter++;
                      if (_counter == _allPostsRef.posts.length) {
                        _counter = 0;
                      }
                    });
                  },
                ),
              ),
            ),
    );
  }
}
