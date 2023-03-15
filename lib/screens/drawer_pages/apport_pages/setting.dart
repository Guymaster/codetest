import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0bfb0b),
          ),
        ),
        title: Text('Paramètres',
          style: TextStyle(color: Color(0xFF0e3664), fontWeight: FontWeight.bold),

        ),
        centerTitle: true,
      ),
      body: Container(
        color:  Color(0xFF0e3664),
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [

            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color:Color(0xFF0bfb0b),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Mon Compte",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Changer le mot de passe"),
            buildAccountOptionRow(context, "Contenu "),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Color(0xFF0bfb0b),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 50,
            ),
            Center(
              child: RaisedButton(
                  color: Color(0xFF0bfb0b),
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(20),

                ),
                onPressed: () {},
                child: Text("Déconnexion",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.white)),
              ),

            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Fermer")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}