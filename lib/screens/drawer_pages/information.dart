import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/apports.dart';
import 'package:groupe/screens/drawer_pages/profilepage.dart';

import '../menu_page/acc.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key, String? title}) : super(key: key);

  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
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
                              MaterialPageRoute(builder: (context) => InformationScreen()),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InformationScreen()),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InformationScreen()),
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
              onTap: () {},
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
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        bottomOpacity: 2,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,
                  color: Color(0xFF0e3664),
                  size: 30 // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('images/logo.png', height: 77)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Color(0xFF0e3664),
                size: 35,
              ),
              onPressed: null,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Color(0xFF0e3664),
                size: 37,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>ProfilepageScreen()),
                );
              },
            ),
          ),
        ],
        centerTitle: true,
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xffE0E0E0),




        child: Stack(children: <Widget>[

          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                padding : EdgeInsets.only(top: 30),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: AssetImage('images/img.png'),
                      fit: BoxFit.cover),
                ),

                child: Row(

                  children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>AccScreen()),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Infos Groupe",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],


                ),
              ),

            ],
          ),






          Padding(
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding:
                  EdgeInsets.only(top: circleRadius / 2.0, ),  ///here we create space for the circle avatar to get ut of the box
                  child: Container(
                    height: 530.0,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                        border: Border.all(
                          color: Color(0xFF0e3664),
                          width: 5,
                        ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 3.0),
                        ),
                      ],

                    ),
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 75.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: circleRadius/5,),

                            Text('Bouygues Groupe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0,  color: Color(0xFF0e3664)),),
                            Text('Créer depuis le 12/04/2022', style: TextStyle(fontWeight: FontWeight.bold,fontStyle :  FontStyle .italic, fontSize: 12.0, color: Colors.grey),),

                            SizedBox(
                              height: 30.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Le groupe Bouygues est constitués de 4 contributions pour permettre '
                                            'à toute personne désireuse d"épargner de pouvoir le faire facilement et en toute transparence.'


                                        ,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color(0xFF0e3664),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),

                                    ],
                                  ),
                                  Divider(),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Types de contributions'


                                        ,
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Color(0xFF0e3664),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Text(
                                        'Fêtes,scolaire,immobilier,électroménager' ,

                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Color(0xFF0e3664),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),

                                    ],
                                  ),


                                ],
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ),



                ///Image Avatar
                Container(
                  width:200,
                  height: 137,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF0e3664),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Center(
                      child:  CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 100,
                        child: CircleAvatar(
                          radius: 110,
                          backgroundImage: AssetImage('images/asso1.jpg'),
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),


    );
  }
}
