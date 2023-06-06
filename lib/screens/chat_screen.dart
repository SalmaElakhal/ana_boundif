import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String title;

  const ChatScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 245),
      appBar: AppbarChat(title: title),
      body: Scaffold(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
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
