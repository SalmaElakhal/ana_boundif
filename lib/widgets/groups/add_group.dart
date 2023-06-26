import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({Key? key}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  File? selectedImage;

  void _importImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);

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
        child: GestureDetector(
          onTap: _importImage,
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
                  width: 340,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 253, 241),
                    border: Border.all(
                      color: Color.fromRGBO(51, 140, 129, 0.36),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(33),
                  ),
                  child: selectedImage != null
                      ? Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                        )
                      : Column(
                          children: [
                            SizedBox(height: 30),
                            Image.asset(
                              'images/addGroup.png',
                              height: 80,
                              width: 80,
                            ),
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
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF424242),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Titre',
                        hintStyle: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color.fromARGB(255, 167, 162, 162),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 160,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF424242),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Entrer votre adresse',
                        hintStyle: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color.fromARGB(255, 167, 162, 162),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 90),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF8CB60C),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(51, 140, 129, 0.06),
                        offset: Offset(0, 40),
                        blurRadius: 40,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Terminer',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
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
