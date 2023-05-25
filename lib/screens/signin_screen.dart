import 'package:ana_boundif/screens/home_screen.dart';
import 'package:ana_boundif/screens/signinnumber_screen.dart';
import 'package:ana_boundif/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ana_boundif/reusable_widget/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  String verificationCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              logoWidget(),
              SizedBox(height: 20.0),
              Transform.translate(
                offset: Offset(0, -20.0),
                child: Text(
                  'Se connecter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.0,
                    width: 130.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for email sign in
                      },
                      child: Text('E-mail'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        primary: Color.fromARGB(255, 3, 71, 45),
                        onPrimary: Color.fromARGB(255, 252, 252, 252),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 40.0,
                    width: 130.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SigninNumber()),
                        );
                      },
                      child: Text('Téléphone'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              reusableTextField(
                'Nom d\'utilisateur',
                Icons.person_outline,
                false,
                _emailTextController,
              ),
              SizedBox(height: 10.0),
              reusableTextField(
                'Mot de passe',
                Icons.lock,
                true,
                _passwordTextController,
              ),
              SizedBox(height: 5.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Action for "Mot de passe oublié"
                  },
                  child: Text('Mot de passe oublié'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text,
                )
                    .then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }).onError((error, stack) {
                  print("Error: ${error.toString()}");
                });
              }),
              SizedBox(height: 20.0),
              Text('Ou connectez-vous avec'),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Action to sign in with Facebook
                    },
                    icon: Icon(Icons.facebook),
                  ),
                  IconButton(
                    onPressed: () {
                      // Action to sign in with Google
                    },
                    icon: Icon(Icons.facebook),
                  ),
                  IconButton(
                    onPressed: () {
                      // Action to sign in with Apple
                    },
                    icon: Icon(Icons.apple),
                  ),
                ],
              ),
              signUpOption(),
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pas encore inscrit(e)?",
          style: TextStyle(color: Color.fromARGB(179, 90, 88, 88)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: Text(
            " Créer un compte",
            style: TextStyle(
              color: Color.fromARGB(255, 42, 42, 40),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
