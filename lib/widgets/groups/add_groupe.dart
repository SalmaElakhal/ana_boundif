import 'package:flutter/material.dart';

class AddChat extends StatefulWidget {
  const AddChat({Key? key}) : super(key: key);

  @override
  State<AddChat> createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {
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
              Container(
                margin: EdgeInsets.all(20),
                width: 340, // Largeur du container
                height: 220, // Hauteur du container
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 253, 241),
                  border: Border.all(
                    color: Color.fromRGBO(51, 140, 129, 0.36),
                    width: 1,
                    // style: BorderStyle.dashed,
                  ),
                  borderRadius: BorderRadius.circular(33),
                ),
                child: Column(
                  children: [
                    Image.asset('images/addGroup.png'),
                    SizedBox(height: 8),
                    Text(
                      'Sélectionnez une image de couverture',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF424242),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'La taille maximale est de 1mo',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color.fromRGBO(66, 66, 66, 0.54),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 16,
                      top: 12,
                      child: Text(
                        'Titre',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 40,
                      right: 16,
                      bottom: 12,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Titre',
                          hintStyle: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF424242),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      backgroundColor: Color.fromARGB(255, 3, 65, 61),
      toolbarHeight: 80.0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 58, top: 5),
                child: Text("Ajouter un groupe"),
              ),
            ],
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
