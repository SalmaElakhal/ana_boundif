import 'package:ana_boundif/reusable_widget/reusable_widget.dart';
import 'package:ana_boundif/screens/chat_screen.dart';
import 'package:ana_boundif/widgets/groups/add_group.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DetailsGroup extends StatefulWidget {
  final String description;
  final String title;
  final String imageUrl;
  final String leagueId;

  DetailsGroup({
    required this.description,
    required this.title,
    required this.imageUrl,
    required this.leagueId,
  });

  @override
  _DetailsGroupState createState() => _DetailsGroupState();
}

class _DetailsGroupState extends State<DetailsGroup> {
  String chatId = Uuid().v4(); // Generate a unique ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDetails(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.0),
              // Image group
              Container(
                margin: EdgeInsets.only(top: 5.0, left: 5),
                width: 350.0,
                height: 190.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      widget.title + " title",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        letterSpacing: 0.0,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 100.0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/devise.png',
                      width: 32.0,
                      height: 32.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Description
              Container(
                margin: EdgeInsets.only(left: 10.0),
                height: 150.0,
                width: 340.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 244, 240),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Color(0xFF9FC627),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito',
                        height: 1.3382,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.description +
                          " Computer development has been the main driver of the technological revolution.",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        height: 1.3,
                        color: Color(0xFF424242),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // Creation
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Créé par",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    height: 1.5,
                    color: Color(0xFF424242),
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/avatar.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'anaboundif',
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        height: 1.3636,
                        color: Color(0xFF667080),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              // Participation
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Participants",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    height: 1.5,
                    color: Color(0xFF424242),
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/perso.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/perso1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/perso2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "+ voir les 48 membres",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            height: 1.3636,
                            color: Color(0xFF667080),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Défis attribués",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    height: 1.5,
                    color: Color(0xFF424242),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                height: 230.0,
                width: 340.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 244, 240),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 250, bottom: 60.0),
                      child: Image.asset(
                        'images/feuille2.png',
                        width: 380.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 250, bottom: 40.0),
                      child: Image.asset(
                        'images/feuille1.png',
                        width: 290.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 150, right: 230.0),
                      child: Image.asset(
                        'images/feuille3.png',
                        width: 290.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 38, left: 228.0),
                      child: Image.asset(
                        'images/feuille4.png',
                        width: 290.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 35, left: 60),
                          child: Text(
                            "Lorem ipsum dolor\nsit at consectetur",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0,
                              height: 1.364,
                              color: Color(0xFF424242),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 35, left: 70),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddGroup()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF9FC627),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              minimumSize: Size(170.0, 48.0),
                              elevation: 8.0,
                              shadowColor: Colors.green,
                            ),
                            child: Text(
                              "Ajouter un groupe",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                                fontFamily: "Nunito",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 340.0,
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          title: widget.title,
                          chatId: chatId,
                          leagueId: widget.leagueId,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Color(0xFFFFEACC),
                    shadowColor: Color.fromRGBO(255, 152, 0, 0.09),
                    elevation: 4.0,
                  ),
                  child: Text(
                    'Rejoindre le chat ',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      height: 1.2632,
                      letterSpacing: 0.0,
                      color: Color(0xFFFF9800),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
