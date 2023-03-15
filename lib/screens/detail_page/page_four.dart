import 'package:flutter/material.dart';
import 'package:groupe/screens/login_page/auth_page.dart';
import 'package:groupe/classes/navigation.dart';

import '../../utils/colors.dart';


class FourScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 90.0,
            backgroundColor: Colors.white,
            shadowColor: Colors.black, bottomOpacity: 2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Image.asset('images/logo.png', height:90)
                ),

              ],

            ),
          ),




          body: Center(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/caisse.png'),
                              fit: BoxFit.cover),
                        ),

                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              'Gérez efficacement vos groupes '
                                  'en toute transparence',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                fontFamily: primaryPolice,
                                color: primaryColor,
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
              child: Row(mainAxisSize: MainAxisSize.max,
                  children: [

                    Expanded(
                      child: TextButton.icon(

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConnectPage()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_left ,
                          color: Colors.white,

                        ) ,

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
                          GroupNavigation.to(context, const ConnectPage());

                        },
                        label: Text(
                          "Suivant",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        icon: Icon(
                            Icons.arrow_right ,color: Colors.white),

                      ),
                    ),

                  ]
              )
          )








      ),
    );
  }
}