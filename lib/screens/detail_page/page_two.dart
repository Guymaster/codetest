import 'package:flutter/material.dart';
import 'package:groupe/screens/detail_page/page_three.dart';
import 'package:groupe/screens/login_page/auth_page.dart';
import 'package:groupe/classes/navigation.dart';

import '../../utils/colors.dart';

import '../home_page/acceuil.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/back3.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 0,
                              child:
                                  Image.asset('images/logo.png', width: 300)),
                          Padding(
                            padding: const EdgeInsets.only(left: 19),
                            child: Text(
                              'Bienvenue dans GROUPE '
                              'votre application de gestion de contributions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                height: 2,
                                fontWeight: FontWeight.w500,
                                fontFamily: thirdPolice,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: new Container(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            padding: EdgeInsets.all(0.0),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConnectPage()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Passer",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    GroupNavigation.destroy(context);
                    GroupNavigation.to(context, ThreeScreen());
                  },
                  label: Text(
                    "Suivant",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.arrow_right, color: Colors.white),
                ),
              ),
            ])));
  }
}
