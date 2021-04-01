import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/imageSlideWidget.dart';
import 'widgets/infoBannerWidget.dart';
import 'widgets/contentTextWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light));

    return SafeArea(
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
                    child: ImageSlideWidget(),
                  )),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 13,
                  child: Container(
                    color: Colors.black,
                    child: InfoBannerWidget(),
                  )),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 60,
                  child: Container(
                    color: Colors.black,
                    child: ContentTextWidget(),
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
          backgroundColor: Colors.red,
          onPressed: () {},
        ),
      ),
    );
  }
}
