import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int? correctButtonIndex;
  int? selectedButtonIndex;
  String message = '';
  String additionalMessage = '';

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: Color.fromARGB(255, 3, 65, 61),
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Text(
                            'How much have global average temperatures increased in the last century?',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color.fromARGB(255, 44, 48, 52),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 0;
                              additionalMessage =
                                  'Informations complémentaires';
                              message =
                                  'Global average temperatures have increased more than 1.4 degrees Fahrenheit over the last 100 years. Scientists project that Earth\'s average temperature will rise between two and 12 degrees Fahrenheit by 2100.';
                            });
                            _scrollToBottom();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedButtonIndex == 0
                                ? Colors.green
                                : Colors.white,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Color.fromARGB(255, 201, 197, 197),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 270,
                            height: 55,
                            child: Center(
                              child: Text(
                                '2.1 degrees Fahrenheit',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 1;
                              message = '';
                              additionalMessage = '';
                            });
                            _scrollToBottom();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedButtonIndex == 1
                                ? Colors.red
                                : Color.fromARGB(255, 255, 255, 255),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Color.fromARGB(255, 201, 197, 197),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 270,
                            height: 55,
                            child: Center(
                              child: Text(
                                '0.6 degrees Fahrenheit',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 2;
                              message = '';
                              additionalMessage = '';
                            });
                            _scrollToBottom();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedButtonIndex == 2
                                ? Colors.red
                                : Color.fromARGB(255, 255, 255, 255),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Color.fromARGB(255, 201, 197, 197),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 270,
                            height: 55,
                            child: Center(
                              child: Text(
                                '4.3 degrees Fahrenheit',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 3;
                              additionalMessage = '';
                              message = '';
                            });
                            _scrollToBottom();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedButtonIndex == 3
                                ? Colors.red
                                : Color.fromARGB(255, 255, 255, 255),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Color.fromARGB(255, 201, 197, 197),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 270,
                            height: 55,
                            child: Center(
                              child: Text(
                                '1.4 degrees Fahrenheit',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                additionalMessage,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF878E9F),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 44, 48, 52),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToBottom() {
    if (selectedButtonIndex != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      backgroundColor: Color.fromARGB(255, 3, 65, 61),
      toolbarHeight: 80.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Ajoutez ici la logique pour revenir en arrière
            },
          ),
          Container(
            margin: EdgeInsets.only(right: 120, top: 5),
            child: Text("Quiz du jour"),
          ),
        ],
      ),
      // Ajoutez ici d'autres éléments d'action si nécessaire
    );
  }
}
