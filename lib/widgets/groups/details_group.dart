import 'package:ana_boundif/reusable_widget/reusable_widget.dart';
import 'package:flutter/material.dart';

class DetailsGroup extends StatelessWidget {
  final String description;
  final String title;
  final String imageUrl;

  DetailsGroup({
    required this.description,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarDetails(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.0),
            Container(
              margin: EdgeInsets.only(top: 5.0, left: 5),
              width: 350.0,
              height: 210.0,
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
            SizedBox(
              height: 20,
            ),
            Text(
              (title + "title"),
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 25.0, // Ajuster la taille de police souhaitée
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
