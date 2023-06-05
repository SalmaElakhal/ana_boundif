import 'package:ana_boundif/providers/internet_provider.dart';
import 'package:ana_boundif/providers/sign_in_provider.dart';
// import 'package:ana_boundif/screens/signin_screen.dart';
import 'package:ana_boundif/screens/splash_screen.dart';
//import 'package:ana_boundif/screens/signinnumber_screen.dart';
//import 'package:ana_boundif/screens/verification_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  //  runApp(const MaterialApp(debugShowCheckedModeBanner:false,
  //  home: SignInScreen()));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => InternetProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(
        //       seedColor: const Color.fromARGB(255, 58, 164, 183)),
        //   useMaterial3: true,
        // ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
