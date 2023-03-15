import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:groupe/screens/drawer_pages/information.dart';

import '../contributioninfo.dart';

void main() {
  runApp(ParametreScreen());
}

class ParametreScreen extends StatelessWidget {
  const ParametreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(

          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF0e3664),
            ),
          ),
          title: Text('Paramètres',
            style: TextStyle(color: Color(0xFF0e3664), fontWeight: FontWeight.bold),

          ),
          centerTitle: true,
        ),
        body: Container(
          color:  Color(0xFF0e3664),
          child: Padding(

            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                // user card
                BigUserCard(
                  cardColor: Colors.green[600],
                  userName: "Anne Doe",
                  userProfilePic:  AssetImage('images/imginfo.png'),
                  cardActionWidget: SettingsItem(
                    icons: Icons.edit,
                    iconStyle: IconStyle(
                      withBackground: true,
                      borderRadius: 50,
                      backgroundColor:  Color(0xFF0e3664),
                    ),
                    title: "Changer de contribution",
                    subtitle: "Passez à une autre contribution ici",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContributionScreen()),
                      );
                    },
                  ),
                ),
                SettingsGroup(
                  items: [

                    SettingsItem(
                      onTap: () {},
                      icons: Icons.fingerprint,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: const Color(0xFF0e3664),
                      ),
                      title: 'Politiques de confidentialité',
                      subtitle: "Consultez - les ici",
                    ),
                    SettingsItem(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InformationScreen()),
                        );
                      },
                      icons: Icons.info_rounded,
                      iconStyle: IconStyle(
                        backgroundColor: Color(0xFF0e3664),
                      ),
                      title: 'A propos',
                      subtitle: "Savoir plus sur l'application GROUPE",
                    ),
                  ],
                ),

                // You can add a settings title
                SettingsGroup(

                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.exit_to_app_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: const Color(0xFF0e3664),
                      ),
                      title: "Déconnexion",
                      subtitle: "Déconnectez - vous ici",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.repeat,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: const Color(0xFF0e3664),
                      ),
                      title: "Changer l'e-mail",
                      subtitle: "Modifiez votre e-mail ici",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.delete_solid,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: const Color(0xFF0e3664),
                      ),
                      title: "Supprimer le compte",
                      subtitle: "Supprimez votre compte ici",
                      titleStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}