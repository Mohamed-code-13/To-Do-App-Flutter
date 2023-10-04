import 'package:flutter/material.dart';

import '../size_config/size_config.dart';
import '../widgets/animated_text.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    initializeAnimation();

    navigateToHomeScreen();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getImage(),
            AnimatedText(title: 'To Do App', slideAnimation: _slideAnimation),
          ],
        ),
      ),
    );
  }

  Widget _getImage() {
    return Image.asset(
      'assets/logo.png',
      height: SizeConfig.screenWidth / 2,
    );
  }

  void initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(_animationController);

    _animationController.forward();
  }

  void navigateToHomeScreen() {
    Future.delayed(
      const Duration(milliseconds: 1200),
      () => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
    );
  }
}
