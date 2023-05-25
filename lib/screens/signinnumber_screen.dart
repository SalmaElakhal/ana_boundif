import 'package:ana_boundif/screens/otp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

//import 'package:ana_boundif/screens/otp_page.dart';

class SigninNumber extends StatefulWidget {
  const SigninNumber({Key? key}) : super(key: key);

  @override
  State<SigninNumber> createState() => _SigninNumberState();
}

class _SigninNumberState extends State<SigninNumber> {
  final phoneController = TextEditingController();
  bool showLoading = false;
  String verificationFailedMessage = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: showLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Spacer(),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          showLoading = true;
                        });
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+212600646077', 
                          //phoneController.text,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {
                            setState(() {
                              showLoading = false;
                            });
                            setState(() {
                              verificationFailedMessage = e.message ?? "error!";
                            });
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            setState(() {
                              showLoading = false;
                            });
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => OTPPage(
                                isTimeOut2: false,
                                verificationId: verificationId,
                              ),
                            ));
                          },
                          timeout: const Duration(seconds: 10),
                          codeAutoRetrievalTimeout: (String verificationId) {
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => OTPPage(
                                isTimeOut2: true,
                                verificationId: verificationId,
                              ),
                            ));
                          },
                        );
                      },
                      child: const Text("SEND"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(verificationFailedMessage),
                    Spacer(),
                  ],
                ),
              ));
  }
}
