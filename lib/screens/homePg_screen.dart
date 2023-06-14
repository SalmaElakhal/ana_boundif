import 'package:ana_boundif/widgets/Game&Quiz/Game_page.dart';
import 'package:flutter/material.dart';

class HomePgScreen extends StatefulWidget {
  const HomePgScreen({Key? key}) : super(key: key);

  @override
  State<HomePgScreen> createState() => _HomePgScreenState();
}

class _HomePgScreenState extends State<HomePgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 3, 65, 61),
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 244, 244),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 0.0, top: 0.0, right: 185.0, bottom: 0),
                      child: Text(
                        "Suivre mon progrés",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          height: 1.0,
                          letterSpacing: 0.374,
                          color: Color(0xFF383D44),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF9FC627),
                                Color(0xFF7EA409),
                              ],
                              stops: [0.0501, 0.6946],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x4CC1B2),
                                offset: Offset(0.0, 4.0),
                                blurRadius: 40.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Icon(
                                        Icons.music_note,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 13.0,
                                      ),
                                      Text(
                                        "BADGES",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(
                                              245, 245, 245, 0.79),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 13.0,
                                      ),
                                      Text(
                                        "95",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 13.0,
                                      ),
                                      Text(
                                        "DEFIS COMPLETES",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(
                                              245, 245, 245, 0.79),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 13.0,
                                      ),
                                      Text(
                                        "63",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Icon(
                                        Icons.group,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 13.0,
                                      ),
                                      Text(
                                        "GROUPES",
                                        style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(
                                              245, 245, 245, 0.79),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 13.0,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 170.0, bottom: 50.0),
                      child: Text(
                        "Comment ça marche ?",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          height: 1.0,
                          letterSpacing: 0.374,
                          color: Color(0xFF383D44),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 11.0,
                          ),
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            gradient: RadialGradient(
                              center: const Alignment(0.0534, 0.0196),
                              radius: 1.0176,
                              colors: [Color(0xFFFB866F), Color(0xFFD7654F)],
                            ),
                            boxShadow: [],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 130.0, top: 30),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 248, 143, 143),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(right: 45.0),
                                child: Text(
                                  "Participer \n aux défis",
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    letterSpacing: 0.374,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Lorem ipsum dolor\n sit amet consectetur\n adipiscing elit",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 0),
                        Container(
                          margin: EdgeInsets.only(
                            left: 11.0,
                          ),
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            gradient: RadialGradient(
                              center: const Alignment(0.0534, 0.0196),
                              radius: 1.0176,
                              colors: [Color(0xFFF4C868), Color(0xFFEFBE54)],
                            ),
                            boxShadow: [],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 130.0, top: 30),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 247, 214, 142),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  "Echanger \n mes points",
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    letterSpacing: 0.374,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Lorem ipsum dolor\n sit amet consectetur\n adipiscing elit",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 240.0,
                      ),
                      child: Text(
                        "Nouveautés ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          height: 1.0,
                          letterSpacing: 0.374,
                          color: Color(0xFF383D44),
                        ),
                      ),
                    ),
                    Container(
                      width: 360.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24.0),
                          bottom: Radius.circular(24.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('images/quiz.png'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, top: 6.82),
                                child: Text(
                                  'Roue de chance',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    letterSpacing: 0.374,
                                    color: Color(0xFF515050),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  'Tournez la roue et\ngagner des\ncadeaux !',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    letterSpacing: 0.374,
                                    color: Color(0xFF383D44),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 15),
                              SizedBox(
                                width: 130,
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SpinWheel()),
                                    );
                                  },
                                  child: Text(
                                    'Lancer',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFFFB240),
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  AppBar appBar() {
    Color appBarColor = const Color.fromARGB(255, 3, 65, 61);
    Color containerColor = const Color(0xFF044F4A);
    Color searchFieldColor = const Color(0xFF044F4A);

    return AppBar(
      elevation: 0,
      backgroundColor: appBarColor,
      toolbarHeight: 150.0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Action lorsque l'icône de trois points est pressée
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(1.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Action lorsque l'icône de notification est pressée
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 13.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: searchFieldColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10.0),
                Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Rechercher',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
