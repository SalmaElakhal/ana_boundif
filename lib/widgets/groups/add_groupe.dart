import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddChat extends StatefulWidget {
  const AddChat({Key? key}) : super(key: key);

  @override
  State<AddChat> createState() => _AddChatState();
}

class _AddChatState extends State<AddChat> {
  File? selectedImage;

  void _importImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: Color.fromARGB(255, 3, 65, 61),
        child: InkWell(
          onTap: _importImage,
          child: Container(
            margin: EdgeInsets.all(20),
            width: 340,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: selectedImage != null
                ? Image.file(
                    selectedImage!,
                    fit: BoxFit.cover,
                  )
                : Column(
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
                child: Text("Ajoutedddr un groupe"),
              ),
            ],
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
