  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatefulWidget {
  final String groupId;
  final String leagueId;

 ChatBody({required this.groupId, required this.leagueId});

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
    var leagueSnapshot =
        await _firestore.collection("leagues").doc(widget.leagueId).get();
    if (leagueSnapshot.exists) {
      var leagueData = leagueSnapshot.data();
      return leagueData?['id'];
    }
    return '';
  }

  Future<void> createGroupChat(String groupId, String leagueId, String userId) async {
    // Vérifier si le groupe de chat existe déjà
    var groupChatSnapshot = await _firestore.collection("chatGroup").doc(groupId).get();
    if (!groupChatSnapshot.exists) {
      // Si le groupe de chat n'existe pas, le créer avec les détails initiaux
      await _firestore.collection("chatGroup").doc(groupId).set({
        'dateCreation': DateTime.now().toString(),
        'dateLastMessage': DateTime.now().toString(),
        'id': groupId,
        'idLeague': leagueId,
        'members': [userId],
        'messages': [],
      });
    }
  }

  Future<void> sendMessage(String groupId, String userId, String message) async {
    // Référence au document du chat de groupe
    var chatRef = _firestore.collection("chatGroup").doc(groupId);

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
                                createGroupChat(widget.groupId, leagueId, signedInUser.uid);

                                // Appeler la fonction sendMessage pour envoyer le message
                                sendMessage(widget.groupId, signedInUser.uid, message ?? '');
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

