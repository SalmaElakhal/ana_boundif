// import 'package:ana_boundif/screens/home_screen.dart';
import 'package:ana_boundif/screens/signin_screen.dart';
import 'package:ana_boundif/screens/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ana_boundif/reusable_widget/reusable_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:math';

class SignUpScreen extends StatefulWidget {
  @override
  final key = GlobalKey<FormState>();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isAccepted = false;
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _lastNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _recepientEmailController = TextEditingController();
  final _mailMessageController = TextEditingController();
  late String verificationCode;

  @override
  void initState() {
    super.initState();
    final random = Random();
    verificationCode = (random.nextInt(90000) + 10000).toString();
    _recepientEmailController.text = _emailTextController.text;
    _mailMessageController.text = 'Voila le code: $verificationCode';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logoWidget(),
                    Transform.translate(
                      offset: Offset(0, -20.0),
                      child: Text(
                        'S\'inscrire',
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
                        Expanded(
                          child: Container(
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // Action pour l'inscription par email
                              },
                              child: Text('E-mail'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                primary: Color.fromARGB(255, 3, 71, 45),
                                onPrimary: Color.fromARGB(255, 252, 252, 252),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {
                                // Action pour l'inscription par téléphone
                              },
                              child: Text('Téléphone'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                primary: Color.fromARGB(255, 255, 255, 255),
                                onPrimary: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text('Civilité:'),
                        Padding(
                          padding: EdgeInsets.only(left: 110.0),
                          child: Row(
                            children: [
                              Radio(value: 0, groupValue: 0, onChanged: (_) {}),
                              Text('Mr'),
                              Radio(value: 1, groupValue: 0, onChanged: (_) {}),
                              Text('Mme'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    reusableTextField(
                      'Nom',
                      Icons.person,
                      false,
                      _lastNameTextController,
                    ),
                    SizedBox(height: 10.0),
                    reusableTextField(
                      'Prénom',
                      Icons.person,
                      false,
                      _firstNameTextController,
                    ),
                    SizedBox(height: 10.0),
                    reusableTextField(
                      'Adresse e-mail',
                      Icons.email,
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
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Checkbox(
                          value: isAccepted,
                          onChanged: (value) {
                            setState(() {
                              isAccepted = value!;
                            });
                          },
                        ),
                        Text('J\'accepte les termes et conditions'),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    signInSignUpButton(context, false, () {
                      sendMail(
                        recipientEmail:
                            _recepientEmailController.text.toString(),
                        mailMessage: _mailMessageController.text.toString(),
                      );
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                          .then((value) {
                        print(
                            'voilà le code de vérification : $verificationCode');
                        // Envoyer l'e-mail de vérification avec le code
                        // sendVerificationEmail(
                        //     _emailTextController.text, verificationCode);

                        // Rediriger vers l'écran de vérification
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VerificationScreen(verificationCode),
                          ),
                        );
                      }).catchError((error) {
                        print('Error: ${error.toString()}');
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
                            // Action pour se connecter avec Google
                          },
                          icon: Icon(Icons.facebook),
                        ),
                        IconButton(
                          onPressed: () {
                            // Action pour se connecter avec Google
                          },
                          icon: Icon(Icons.facebook),
                        ),
                        IconButton(
                          onPressed: () {
                            // Action pour se connecter avec Apple
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
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Pas encore inscrit(e)?",
          style: TextStyle(color: Color.fromARGB(179, 90, 88, 88)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          },
          child: const Text(
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

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FittedBox(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }

  void sendMail({
    required String recipientEmail,
    required String mailMessage,
  }) async {
    // Changez votre adresse e-mail ici
    String username = 'salma.elakhal.pro@gmail.com';
    // Changez votre mot de passe ici
    String password = 'sbsakdfgzvyejxdv';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Salma')
      ..recipients.add(recipientEmail)
      ..subject = 'Subject of the email'
      ..text = 'Message: $mailMessage';

    try {
      await send(message, smtpServer);
      showSnackbar('E-mail envoyé avec succès');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
