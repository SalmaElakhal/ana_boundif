import 'package:ana_boundif/widgets/Chat/chat_body.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String title;
  final String chatId; // Ajout du paramètre chatId
  final String leagueId; // Ajout du paramètre leagueId

  const ChatScreen(
      {Key? key,
      required this.title,
      required this.chatId,
      required this.leagueId
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarChat(title: title),
      body: ChatBody(
          chatId: chatId,
           leagueId:
               leagueId
          ), // Passer les valeurs chatId et leagueId à ChatBody
    );
  }
}

class AppbarChat extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppbarChat({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text(title + " Chat"),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.more_horiz_outlined),
                    onPressed: () {
                      // Action à effectuer lorsque l'icône est cliquée
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}