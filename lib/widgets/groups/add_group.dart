import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({Key? key}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  File? selectedImage;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void _importImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  String getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    // Gérer le cas où aucun utilisateur n'est connecté
    // ou retourner une valeur par défaut appropriée
    return '';
  }

  void _addDataToFirestore() async {
    String title = _titleController.text;
    String description = _descriptionController.text;

    // Vérifier si tous les champs sont remplis
    if (title.isNotEmpty && description.isNotEmpty && selectedImage != null) {
      String currentUserId =
          getCurrentUserId(); // Obtenir l'ID de l'utilisateur connecté

      // Uploader l'image sélectionnée sur Firebase Storage
      String imageUrl = await _uploadImageToFirebaseStorage();

      // Get the file name from the selected image
      String fileName =
          selectedImage != null ? selectedImage!.path.split('/').last : '';

      // Enregistrer les données dans Firestore
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('leagues');

      DocumentReference documentReference = await collectionReference.add({
        'createBy': currentUserId,
        'createDate': DateTime.now(),
        'id': '', // Firebase générera automatiquement l'ID du document
        'status': 'draft',
        'languages': {
          'fr': {
            'description': description,
            'picture': {
              'fileName': fileName,
              'url': imageUrl,
            },
            'title': title,
          },
        },
      });

      // Mettre à jour l'ID du document avec la valeur générée automatiquement
      String groupId = documentReference.id;
      await documentReference.update({'id': groupId});

      // Recharger la page précédente pour afficher la nouvelle carte
      Navigator.pop(context);
    } else {
      // Afficher un message d'erreur si tous les champs ne sont pas remplis
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erreur'),
            content: const Text(
                'Veuillez remplir tous les champs et sélectionner une image.'),
            actions: [
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(
                      // ...
                      ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<String> _uploadImageToFirebaseStorage() async {
    String groupId = ''; // Add the group ID here

    if (selectedImage != null) {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('groups/$groupId.jpg');
      UploadTask uploadTask = storageReference.putFile(selectedImage!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } else {
      // Handle the case when selectedImage is null
      return 'hhhh';
    }
  }

  // Future<String> _uploadImageToFirebaseStorage() async {
  //   String groupId = ''; // Ajoutez l'ID du groupe ici

  //   Reference storageReference =
  //       FirebaseStorage.instance.ref().child('groups/$groupId.jpg');
  //   UploadTask uploadTask = storageReference.putFile(selectedImage!);
  //   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //   String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: const Color.fromARGB(255, 3, 65, 61),
        child: GestureDetector(
          onTap: _importImage,
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 340,
                  height: 190,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 253, 241),
                    border: Border.all(
                      color: const Color.fromRGBO(51, 140, 129, 0.36),
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
                            const SizedBox(height: 30),
                            Image.asset(
                              'images/addGroup.png',
                              height: 80,
                              width: 80,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Sélectionnez une image de couverture',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF424242),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            const Text(
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
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _titleController, // Ajout du controller

                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF424242),
                      ),
                      decoration: const InputDecoration(
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
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 160,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _descriptionController, // Ajout du controller

                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF424242),
                      ),
                      decoration: const InputDecoration(
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
                const SizedBox(height: 90),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8CB60C),
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromRGBO(51, 140, 129, 0.06),
                        offset: Offset(0, 40),
                        blurRadius: 40,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _addDataToFirestore();
                    },
                    child: const Text(
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
      backgroundColor: const Color.fromARGB(255, 3, 65, 61),
      toolbarHeight: 80.0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 58, top: 5),
                child: const Text("Ajouter un groupe"),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
