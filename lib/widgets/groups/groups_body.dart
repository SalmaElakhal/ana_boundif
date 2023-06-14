import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ana_boundif/widgets/groups/details_group.dart';
import 'package:uuid/uuid.dart';

class GroupsBody extends StatefulWidget {
  const GroupsBody({Key? key}) : super(key: key);

  @override
  _GroupsBodyState createState() => _GroupsBodyState();

  Future<List<String>> getIdLeagues() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("leagues").get();
    List<String> ids = querySnapshot.docs.map((doc) => doc.id).toList();
    return ids;
  }
}

class _GroupsBodyState extends State<GroupsBody> {
  Future<List<Map<String, dynamic>>> getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("leagues").get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((doc) => doc.get("languages.fr") as Map<String, dynamic>)
        .toList();
    return data;
  }

  Future<List<String>> getId() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("leagues").get();
    List<String> ids = querySnapshot.docs.map((doc) => doc.id).toList();
    return ids;
  }

  Future<String> getImageUrl(String fileName) async {
    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
    String imageUrl = await storageRef.getDownloadURL();
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Color.fromARGB(255, 243, 245, 245),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: getData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Erreur: ${snapshot.error}");
                  } else {
                    List<Map<String, dynamic>> data = snapshot.data!;
                    return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> groupData = data[index];
                        String description = groupData["description"];
                        String title = groupData["title"];
                        String fileName = groupData["picture"]["fileName"];
                        String leagueId = getId().toString();
                        return FutureBuilder<String>(
                          future: getImageUrl(fileName),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> imageUrlSnapshot) {
                            if (imageUrlSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (imageUrlSnapshot.hasError) {
                              return Text(
                                  "Erreur lors du chargement de l'image: ${imageUrlSnapshot.error}");
                            } else {
                              String imageUrl = imageUrlSnapshot.data!;
                              return GroupCard(
                                description: description,
                                title: title,
                                imageUrl: imageUrl,
                                leagueId: leagueId,
                              );
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  final String description;
  final String title;
  final String imageUrl;
  final String leagueId;

  GroupCard({
    Key? key,
    required this.description,
    required this.title,
    required this.imageUrl,
    required this.leagueId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsGroup(
              description: description,
              title: title,
              imageUrl: imageUrl,
              leagueId: leagueId,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8 / 2,
        ),
        height: 170.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 25,
                color: Colors.black12,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.0),
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    top: 25.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 8.0),
                      Row(
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
                            'anaBoundif',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 180.0,
                          height: 43.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // Logic to join the group
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 12.0,
                              ), // Adjust the button height
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              backgroundColor:
                                  Color.fromARGB(255, 243, 228, 228),
                              // Light green background
                            ),
                            child: Text(
                              'Rejoindre',
                              style: TextStyle(
                                color: Color.fromARGB(255, 237, 142, 94),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}