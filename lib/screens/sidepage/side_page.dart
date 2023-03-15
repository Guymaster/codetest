import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/apports.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/parametre.dart';
import 'package:groupe/screens/home_page/acceuil.dart';

import '../drawer_pages/information.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {


    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: new ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Image.asset('images/groupelogo.png', width: 150),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Bouygues Groupe",
                      style: TextStyle(color: Color(0xFF0e3664), fontSize: 20),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pic.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color(0xFF0e3664),
                size: 25.0,
              ),
              title: const Text(
                'Information',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF0e3664),
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationScreen()),
                );

              },
            ),
            ExpansionTile(
              leading: Icon(
                Icons.groups_outlined,
                color: Color(0xFF0e3664),
                size: 30.0,
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Color(0xFF0e3664),
                size: 20.0,
              ),
              title: Text(
                'Types de contributions',
                style: TextStyle(
                  color: Color(0xFF0e3664),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Expanded(
                    child: ExpansionTile(
                      title: const Text(
                        'Scolaire',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xFF0e3664),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Color(0xFF0e3664),
                        size: 20.0,
                      ),
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.monetization_on_outlined,
                            color: Color(0xFF0e3664),
                            size: 20.0,
                          ),
                          title: const Text(
                            'Apports',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF0e3664),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ApportScreen()),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.warning,
                            color: Color(0xFF0e3664),
                            size: 20.0,
                          ),
                          title: const Text(
                            'Sanctions',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF0e3664),
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.folder_rounded,
                            color: Color(0xFF0e3664),
                            size: 20.0,
                          ),
                          title: const Text(
                            'Documents',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF0e3664),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: ExpansionTile(
                    title: const Text(
                      'Immobilier',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xFF0e3664),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Color(0xFF0e3664),
                      size: 20.0,
                    ),
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.money_off,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Apports',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.warning,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Sanctions',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.folder_rounded,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Documents',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: ExpansionTile(
                    title: const Text(
                      'Fêtes',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xFF0e3664),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Color(0xFF0e3664),
                      size: 20.0,
                    ),
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.money_off,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Apports',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.warning,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Sanctions',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.folder_rounded,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Documents',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: ExpansionTile(
                    title: const Text(
                      'Appareils',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xFF0e3664),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Color(0xFF0e3664),
                      size: 20.0,
                    ),
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.money_off,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Apports',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.warning,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Sanctions',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.folder_rounded,
                          color: Color(0xFF0e3664),
                          size: 20.0,
                        ),
                        title: const Text(
                          'Documents',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF0e3664),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color(0xFF0e3664),
                size: 25.0,
              ),
              title: const Text(
                'Paramètres',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF0e3664),
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParametreScreen()),
                );


              },
            ),
            ListTile(
              leading: const Icon(
                Icons.remove_red_eye_sharp,
                color: Color(0xFF0e3664),
                size: 25.0,
              ),
              title: const Text(
                'Nos autres produits',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF0e3664),
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Color(0xFF0e3664),
                size: 25.0,
              ),
              title: const Text(
                'Aide',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF0e3664),
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
            ),
          ],
        )
      );


    }

  }