import 'package:ana_boundif/widgets/groups/groups_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatefulWidget {
  final String chatId;
  final String leagueId;

  ChatBody({required this.chatId, required this.leagueId});

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? message;
  late User signedInUser;
  late FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    getUser();
  }

  Future<void> getUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        signedInUser = user;
      });
      print('Signed-in user email: ${signedInUser.email}');
    }
  }

  Future<String> getLeagueId() async {
    var leagueSnapshot = await FirebaseFirestore.instance
        .collection("leagues")
        .where("id", isEqualTo: widget.leagueId)
        .get();

    if (leagueSnapshot.docs.isNotEmpty) {
      var leagueData = leagueSnapshot.docs.first.data();
      return leagueData['id'];
    }

    var groupsBody = GroupsBody();
    var ids = await groupsBody.getId();
    return ids.first;
  }

  Future<void> createGroupChat(
      String chatId, String leagueId, String userId) async {
    // Vérifier si un document avec le même leagueId existe déjà
    var querySnapshot = await _firestore
        .collection("chatGroup")
        .where("idLeague", isEqualTo: leagueId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Un document avec le même leagueId existe déjà, récupérer l'ID du document
      var existingChatId = querySnapshot.docs.first.id;

      // Récupérer le tableau des messages du groupe de chat existant
      var existingMessages = querySnapshot.docs.first.data()['messages'];

      // Créer un nouveau message
      var newMessage = {
        'date': DateTime.now().toString(),
        'file': [],
        'lu': 0,
        'iduser': userId,
        'message': message,
      };

      // Mettre à jour le document du groupe de chat existant pour ajouter le nouveau message
      await _firestore.collection("chatGroup").doc(existingChatId).update({
        'dateLastMessage': DateTime.now().toString(),
        'messages': [...existingMessages, newMessage],
      });
    } else {
      // Aucun document avec le même leagueId n'existe, créer un nouveau document
      await _firestore.collection("chatGroup").doc(chatId).set({
        'dateCreation': DateTime.now().toString(),
        'dateLastMessage': DateTime.now().toString(),
        'id': chatId,
        'idLeague': leagueId,
        'members': [userId, leagueId],
        'messages': [
          {
            'date': DateTime.now().toString(),
            'file': [],
            'lu': 0,
            'iduser': userId,
            'message': message,
          }
        ],
      });
    }
  }

  Future<void> sendMessage(String chatId, String userId, String message) async {
    // Référence au document du chat de groupe
    var chatRef = _firestore.collection("chatGroup").doc(chatId);

    // Obtenir la date actuelle
    var currentDate = DateTime.now().toString();

    // Mettre à jour le champ "dateLastMessage" avec la nouvelle date
    await chatRef.update({'dateLastMessage': currentDate});

    // Créer un nouveau message
    var newMessage = {
      'date': currentDate,
      'file': [],
      'lu': 0,
      'iduser': userId,
      'message': message,
    };

    // Ajouter le nouveau message au tableau "messages"
    await chatRef.update({
      'messages': FieldValue.arrayUnion([newMessage]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getLeagueId(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String leagueId = snapshot.data!;
          return Column(
            children: [
              // ... Autres éléments de la page de chat ...

              Expanded(
                child: Text(signedInUser.email ?? ''),
                // child: ListView.builder(
                // ... Liste des messages ...
              ),
              //),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Action à effectuer lorsque le bouton d'importation d'image est cliqué
                      },
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          message = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Écrivez un message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 245, 245, 245),
                          suffixIcon: Container(
                            height: 20.0,
                            width: 45.0,
                            margin: EdgeInsets.only(right: 7.0, bottom: 3.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 55, 163, 9),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Appeler la fonction createGroupChat pour créer un nouveau chat de groupe
                                createGroupChat(
                                    widget.chatId, leagueId, signedInUser.uid);

                                // Appeler la fonction sendMessage pour envoyer le message
                                sendMessage(widget.chatId, signedInUser.uid,
                                    message ?? '');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("Erreur: ${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
