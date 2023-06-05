import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class logoWidget extends StatelessWidget {
  const logoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: Image.asset('images/logo.png'), // Logo au début de la page
    );
  }
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 158, 150, 150),
    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(255, 192, 199, 193).withOpacity(0.9),
      ),
      labelText: text,
      labelStyle:
          TextStyle(color: Color.fromARGB(255, 192, 199, 193).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color.fromARGB(255, 241, 235, 253).withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: 100,
    height: 60,
    margin: const EdgeInsets.fromLTRB(0, 18, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Color.fromARGB(255, 94, 204, 9);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

AppBar Appbar() {
  return AppBar(
    elevation: 0, // to elemine a row between appBar and body
    automaticallyImplyLeading: false,
    backgroundColor: Color.fromARGB(255, 3, 65, 61),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(
    //     bottom: Radius.circular(20.0),
    //   ),
    // ),
    toolbarHeight: 100.0,
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Action when more options icon is pressed
              },
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Action when search icon is pressed
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Action when notification icon is pressed
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                // Action when "Groupes" is tapped
              },
              child: Text(
                'Groupes',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            InkWell(
              onTap: () {
                // Action when "Lignes" is tapped
              },
              child: Text(
                'Lignes',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            InkWell(
              onTap: () {
                // Action when "Classement" is tapped
              },
              child: Text(
                'Classement',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

AppBar AppbarDetails() {
  return AppBar(
    elevation: 0, // to elemine a row between appBar and body
    automaticallyImplyLeading: true,
    backgroundColor: Color.fromARGB(255, 3, 65, 61),
    toolbarHeight: 80.0,
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(left: 90, top: 10),
                child: Text("Détails")),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Action when search icon is pressed
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Action when notification icon is pressed
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
