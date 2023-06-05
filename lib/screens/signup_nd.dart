import 'package:ana_boundif/providers/sign_in_provider.dart';
import 'package:ana_boundif/screens/signin_screen.dart';
import 'package:ana_boundif/screens/start_adventure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupNd extends StatefulWidget {
  const SignupNd({Key? key}) : super(key: key);

  @override
  _SignupNdState createState() => _SignupNdState();
}

class _SignupNdState extends State<SignupNd> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: 150.0, bottom: 20.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 50.0), // Added SizedBox to create space below
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Motivation text',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet\nconsectetur adipiscing elit sed do',
                      ),
                    ),

                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.all(70.0),
                      margin: EdgeInsets.only(bottom: 50.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 20.0,
                            child: Text(
                              'Entrez votre adresse',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 100.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartAdventurePage()),
                        );
                      },
                      child: Text(
                        'Se connecter',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.black26;
                            }
                            return Color.fromARGB(255, 94, 204, 9);
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        // Action when "Je vais la saisir plus tard" button is pressed
                      },
                      child: Text(
                        'Je vais la saisir plus tard',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    sp.userSignOut;
                    print("Signed Out");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
