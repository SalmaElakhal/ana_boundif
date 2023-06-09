import 'dart:async';

import 'package:ana_boundif/providers/sign_in_provider.dart';
import 'package:ana_boundif/screens/home_screen.dart';
// import 'package:ana_boundif/screens/signup_nd.dart';
import 'package:ana_boundif/screens/signin_screen.dart';
// import 'package:ana_boundif/utils/config.dart';
import 'package:ana_boundif/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:ana_boundif/reusable_widget/reusable_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const SignInScreen())
          : nextScreen(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage('images/logo2.jpg'),
          height: 200,
          width: 200,
        )),
      ),
    );
  }
}
