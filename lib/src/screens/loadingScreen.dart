import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  Animation<double> logoAnimation;
  AnimationController logoController;
  @override
  void initState() {
    logoController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    logoAnimation = Tween(begin: 1.0,end: 1.15).animate(CurvedAnimation(parent: logoController, curve: Curves.easeInOut));
    logoController.forward();
    logoAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        logoController.reverse();
      }  else if (status == AnimationStatus.dismissed) {
        logoController.forward();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    logoController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width*0.4,
              height: width*0.4,
              child: Stack(
                children: [
                  Center(
                    child: AnimatedBuilder(
                        animation: logoAnimation,
                        builder: (context, child) => Image.asset('assets/techzombie_logo.jpg',width: width*0.25*logoAnimation.value,height: width*0.25*logoAnimation.value,)),
                  ),
                ],
              ),
            ),
            Text('Λήψη δεδομένων ...', style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
