import 'package:ana_boundif/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int? correctButtonIndex;
  int? selectedButtonIndex;
  String additionalMessage = '';
  bool showResult = false;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBody: true,
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
                    margin: EdgeInsets.only(top: 40),
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
                        SizedBox(height: 40),
                        if (!showResult)
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndex = 0;
                                    showResult = true;
                                    additionalMessage = '';
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
                                    showResult = true;
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
                                    showResult = true;
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
                                    showResult = false;
                                    additionalMessage = '';
                                  });
                                  _scrollToBottom();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: selectedButtonIndex == 3
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
                                      '1.4 degrees Fahrenheit',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 150.0),
                              ElevatedButton(
                                onPressed: () {
                                  // Ajoutez ici l'action à effectuer lors du clic sur le bouton "Terminer"
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9FC627),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide.none,
                                  ),
                                  elevation: 6,
                                  shadowColor: Color(0xFF338C81),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 17),
                                ),
                                child: Text(
                                  'Répondre',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        if (showResult)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 120.0, bottom: 5),
                                child: Text(
                                  'LA REPONSE SELECTIONNEE',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF878E9F),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(EdgeInsets.only(
                                    top: 8,
                                    bottom: 8,
                                    left: 10,
                                  )),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color(0xFFF15A29), width: 1),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Action à effectuer lors du clic sur le bouton
                                },
                                child: Container(
                                  width: 300,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedButtonIndex == 0
                                            ? '2.1 degrees Fahrenheit'
                                            : selectedButtonIndex == 1
                                                ? '0.6 degrees Fahrenheit'
                                                : selectedButtonIndex == 2
                                                    ? '4.3 degrees Fahrenheit'
                                                    : '1.4 degrees Fahrenheit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Color(0xFFF15A29),
                                        ),
                                      ),
                                      Icon(
                                        Icons.close,
                                        color: Color(0xFFF15A29),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 145.0, bottom: 5),
                                child: Text(
                                  'LA REPONSE CORRECTE',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF878E9F),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFF53DF83)),
                                  padding: MaterialStateProperty
                                      .all<EdgeInsetsGeometry>(EdgeInsets.only(
                                          top: 8, bottom: 8, left: 10)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Colors.white, width: 1),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Action à effectuer lors du clic sur le bouton
                                },
                                child: Container(
                                  width: 300,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '1.4 degrees Fahrenheit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.verified,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 60.0, bottom: 5),
                                child: Text(
                                  'INFORMATIONS COMPLAIMENTAIRES',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF878E9F),
                                  ),
                                ),
                              ),
                              Text(
                                additionalMessage,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF878E9F),
                                ),
                              ),
                              SizedBox(height: 0),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 28.0,
                                ),
                                child: Text(
                                  'Global average temperatures have increased more than 1.4 degrees Fahrenheit over the last 100 years. Scientists project that Earth\'s average temperature will rise between two and 12 degrees Fahrenheit by 2100.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 44, 48, 52),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Ajoutez ici l'action à effectuer lors du clic sur le bouton "Terminer"
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFFC107),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide.none,
                                  ),
                                  elevation: 6,
                                  shadowColor: Color(0xFF338C81),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 17),
                                ),
                                child: Text(
                                  'Terminer',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 20,
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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
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
