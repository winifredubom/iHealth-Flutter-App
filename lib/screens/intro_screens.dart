import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onBoard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final _slideAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );
  late final Animation<Offset> _slideAnimation =
      Tween<Offset>(begin: const Offset(0, -4), end: const Offset(0, 0))
          .animate(
    CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.elasticInOut,
    ),
  );
  late final _fadeAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _fadeAnimationController,
    curve: Curves.easeInOut,
  );
  late final _scaleAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
    reverseDuration: const Duration(milliseconds: 5000),
  );
  late final Animation<double> _scaleAnimation =
  Tween<double>(begin: 0.4, end: 4).animate(
    CurvedAnimation(
      parent: _scaleAnimationController,
      curve: Curves.elasticInOut,
    ),
  );
  @override
  void initState() {
    super.initState();
    _slideAnimationController.forward();
    _fadeAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 5000)).then((value) {
      _fadeAnimationController.reverse();
      _scaleAnimationController.forward();
    });
    Future.delayed(const Duration(seconds: 5)).then(
          (value) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const OnBoard(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(Tween(begin: 0, end: 1)),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 571),
          reverseTransitionDuration: const Duration(milliseconds: 571),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _slideAnimationController.dispose();
    _fadeAnimationController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: ScaleTransition(scale: _scaleAnimation,
          child: FadeTransition(opacity: _fadeAnimation,
            child: SlideTransition(position: _slideAnimation,
              child: Hero(tag: "splash", child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: h*0.2,
                          width: w*9,
                          decoration:  const BoxDecoration(
                              image: DecorationImage(image: AssetImage(
                                "images/telephone.png",
                              ),)
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("iHealth",
                        style: TextStyle(
                            fontSize: 105,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]
                        ),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("Health First",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 50
                    ),)
                ],
              ),
              ),
            ),
          ),),),);
  }



}
