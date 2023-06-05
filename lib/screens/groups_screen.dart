import 'package:flutter/material.dart';
import '../reusable_widget/reusable_widget.dart';
import '../widgets/groups/groups_body.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 245, 245),
      appBar: Appbar(),
      body: GroupsBody(),
    );
  }
}
