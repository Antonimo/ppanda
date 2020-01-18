import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ppanda/theme/app_colors.dart';
import 'package:ppanda/theme/images.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    final Animation curve = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animation = Tween<double>(
      begin: -50.0,
      end: 50.0,
    ).animate(curve);

    animationController.forward();
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary[900],
        ),
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Center(
                      child: AnimatedBuilder(
                        animation: animationController,
                        builder: (BuildContext context, Widget child) {
                          return Transform.rotate(
                            angle: animation.value * (math.pi / 180.0),
                            origin: Offset(0.0, 8.0),
                            child: child,
                          );
                        },
                        child: Image(
                          image: Images.logo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
