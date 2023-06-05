// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ana_boundif/screens/signup_nd.dart';
// import 'dart:math';

class VerificationScreen extends StatefulWidget {
  final String verificationCode;
  VerificationScreen(this.verificationCode);

  //const VerificationScreen(this.verificationCode, {Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // ignore: prefer_final_fields
  TextEditingController _verificationCodeController = TextEditingController();
  // ignore: unused_field
  String? _enteredCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vérification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Entrez le code de vérification',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _verificationCodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Code de vérification',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Récupérer le code saisi
                String enteredCode = _verificationCodeController.text;
                print(widget.verificationCode.toString());

                // Appeler la méthode pour vérifier le code
                verifyCode(enteredCode);
              },
              child: const Text('Vérifier le code'),
            ),
          ],
        ),
      ),
    );
  }

  void verifyCode(String enteredCode) {
    print(widget.verificationCode.toString());
    // Comparer le code saisi avec le code généré
    if (enteredCode == widget.verificationCode.toString()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Code de vérification'),
            content: const Text('Le code est correct.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Naviguer vers l'écran principal après la vérification réussie
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupNd()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Code de vérification'),
            content: const Text('Le code est incorrect.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
