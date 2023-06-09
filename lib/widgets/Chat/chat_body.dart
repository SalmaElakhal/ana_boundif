import 'package:ana_boundif/widgets/groups/groups_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    var ids = await groupsBody.getIdLeagues();
    return ids.first;
  }

  Future<List<String>> getChatGroupDocumentIds() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("chatGroup").get();
    List<String> documentIds = querySnapshot.docs.map((doc) => doc.id).toList();
    return documentIds;
  }

  Future<void> createGroupChat(String chatId, String leagueId, String userId,
      [String? message]) async {
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
        'file': [
          {'iduser': userId, 'message': message}
        ],
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
            'file': [
              {'iduser': userId, 'message': message}
            ],
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
      'file': [
        {'iduser': userId, 'message': message}
      ],
    };

    // Ajouter le nouveau message au tableau "messages"
    await chatRef.update({
      'messages': FieldValue.arrayUnion([newMessage]),
    });
  }

  Future<List<Map<String, dynamic>>> getMessages(String chatId) async {
    var chatSnapshot =
        await _firestore.collection("chatGroup").doc(chatId).get();
    print(chatId);
    if (chatSnapshot.exists) {
      var chatData = chatSnapshot.data();
      var messages = (chatData?['messages'] as List<dynamic>?)
          ?.cast<Map<String, dynamic>>();

      if (messages != null) {
        // Afficher l'ID du document de chat
        print('ID du document de chat : $chatId');

        for (var message in messages) {
          var messageDate = message['date'];
          var file = message['file'] as List<dynamic>;
          for (var entry in file) {
            var messageUser = entry['iduser'];
            var messageContent = entry['message'];

            print('Message: $messageContent');
            print('Date: $messageDate');
            print('User: $messageUser');
          }
        }
      } else {
        print('Pas de messages');
      }

      return messages ?? [];
    } else {
      throw Exception("Le document chatGroup avec l'ID $chatId n'existe pas.");
    }
  }

  String formatMessageTime(String messageTime) {
    DateTime now = DateTime.now();
    DateTime messageDateTime = DateTime.parse(messageTime);
    Duration difference = now.difference(messageDateTime);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} second${difference.inSeconds == 1 ? '' : 's'} ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago";
    } else {
      return DateFormat('yyyy-MM-dd').format(messageDateTime);
    }
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder<List<String>>(
                        future: getChatGroupDocumentIds(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<String> documentIds = snapshot.data!;
                            return Column(
                              children: [
                                for (String chatId in documentIds)
                                  FutureBuilder<List<Map<String, dynamic>>>(
                                    future: getMessages(chatId),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<Map<String, dynamic>> messages =
                                            snapshot.data!;
                                        return Column(
                                          children: [
                                            for (var message in messages)
                                              Column(
                                                children: [
                                                  ListTile(
                                                    leading: CircleAvatar(
                                                      // Profile icon
                                                      // Replace with appropriate data from the message
                                                      child: Icon(Icons.person),
                                                    ),
                                                    title: Row(
                                                      children: [
                                                        Text(
                                                          'Salma Elakhal',
                                                          // Replace with appropriate data from the message
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          formatMessageTime(
                                                              message['date']),
                                                          // Format the message time using the formatMessageTime function
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0.0),
                                                          child: Text(
                                                            FirebaseAuth
                                                                    .instance
                                                                    .currentUser
                                                                    ?.email ??
                                                                '',
                                                            // Use Firebase Auth to get the authenticated user's email
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10.0,
                                                                  left: 0.0),
                                                          child: Text(
                                                            message['file'][0]
                                                                ['message'],
                                                            // Replace with appropriate data from the message
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors
                                                        .black, // Add a line separator
                                                  ),
                                                ],
                                              ),
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text(
                                          "Erreur lors de la récupération des messages: ${snapshot.error}",
                                        );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              "Erreur lors de la récupération des IDs des documents: ${snapshot.error}",
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
                              onPressed: () async {
                                await createGroupChat(
                                  widget.chatId,
                                  leagueId,
                                  signedInUser.uid,
                                  message ?? '',
                                );

                                // Appeler la fonction sendMessage pour envoyer le message
                                await sendMessage(
                                  widget.chatId,
                                  signedInUser.uid,
                                  message ?? '',
                                );
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
