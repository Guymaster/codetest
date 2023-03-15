import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/exo2.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/tesxt.dart';
import 'package:groupe/screens/menu_page/planning.dart';
import '../drawer_pages/apport_pages/exo.dart';
import '../drawer_pages/apport_pages/nature.dart';
import '../drawer_pages/apport_pages/numeraire.dart';
import '../drawer_pages/apport_pages/parametre.dart';
import '../drawer_pages/contributioninfo.dart';
import '../drawer_pages/groupe2form.dart';
import '../drawer_pages/information.dart';
import '../drawer_pages/profilepage.dart';



class AccScreen extends StatelessWidget {
  const AccScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    IconButton(
                      icon: new Icon( Icons.groups_outlined,
                        color: Color(0xFF0e3664),
                        size: 35,

                      ),
                      onPressed: () { },
                    ),

                    Text(
                      'TYPES DE CONTRIBUTIONS', textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0e3664),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: new Icon( Icons.add,
                        color: Color(0xFF0e3664),
                        size: 20,

                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContributionScreen()),
                        );
                      },
                    ),


                  ],
                ),

            ),


          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: ()=>{
                          Navigator.push(context,MaterialPageRoute(
                        builder: (context) =>  TestApp ()),
                          ),
                        },
                        child: Column(
                          children: [
                            Card(

                              child: Container(
                                height: 150,
                                width: 150,

                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(18.0),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('images/sco2.png'),

                                    ),
                                  boxShadow: [
                                    BoxShadow(

                                      color: Colors.greenAccent,
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                      offset: Offset(-5, 6),//(x,y)
                                     // Shadow position
                                    ),

                                  ],
                                ),

                              ),

                              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),

                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,30,0,0),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Scolaire',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0e3664),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                      ),

                      GestureDetector(
                        onTap: ()=>{
                          Navigator.push(context,MaterialPageRoute(
                              builder: (context) => ProfilepageScreen()),
                          ),
                        },

                        child: Column(
                          children: [
                            Card(

                              child: Container(
                                height: 150,
                                width: 150,

                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(18.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/electro.png'),

                                  ),
                                  boxShadow: [
                                    BoxShadow(

                                      color: Colors.greenAccent,
                                      spreadRadius: 5,
                                      blurRadius: 5,
                                      offset: Offset(-5, 6),//(x,y)
                                      // Shadow position
                                    ),

                                  ],
                                ),

                              ),

                              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),

                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,30,0,0),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Appareils',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0e3664),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                      ),
                     ]
                    ),
                  ),
              ),

            ],


          ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [



                  GestureDetector(
                   onTap: ()=>{
                    Navigator.push(context,MaterialPageRoute(
                     builder: (context) =>  NatureScreen()),
                   ),
                   },
                    child: Column(
                      children: [
                        Card(

                          child: Container(
                            height: 150,
                            width: 150,

                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(18.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/fete.png'),

                              ),
                              boxShadow: [
                                BoxShadow(

                                  color: Colors.greenAccent,
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(-5, 6),//(x,y)
                                  // Shadow position
                                ),

                              ],
                            ),

                          ),

                          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),

                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,30,0,0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Fêtes',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0e3664),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),



                  GestureDetector(
                    onTap: ()=>{
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context) =>  MyApp1()),
                      ),
                    },

                    child: Column(
                      children: [
                        Card(

                          child: Container(
                            height: 150,
                            width: 150,

                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(18.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/immo.png'),

                              ),
                              boxShadow: [
                                BoxShadow(

                                  color: Colors.greenAccent,
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(-5, 6),//(x,y)
                                  // Shadow position
                                ),

                              ],
                            ),

                          ),

                          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),

                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,30,0,0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Immobilier',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0e3664),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [

                  GestureDetector(
                   onTap: ()=>{
                      Navigator.push(context,MaterialPageRoute(
                         builder: (context) =>  GroupApp2()),
                      ),
                   },

                    child: Column(
                      children: [
                        Card(

                          child: Container(
                            height: 150,
                            width: 150,

                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(18.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/sco2.png'),

                              ),
                              boxShadow: [
                                BoxShadow(

                                  color: Colors.greenAccent,
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(-5, 6),//(x,y)
                                  // Shadow position
                                ),

                              ],
                            ),

                          ),

                          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),

                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,30,0,0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Scolaire',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0e3664),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),





                GestureDetector(
                  onTap: ()=>{
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context) =>  GroupApp2()),
                    ),
                  },

                  child: Column(
                    children: [
                      Card(

                        child: Container(
                          height: 150,
                          width: 150,

                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(18.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/electro.png'),

                            ),
                            boxShadow: [
                              BoxShadow(

                                color: Colors.greenAccent,
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: Offset(-5, 6),//(x,y)
                                // Shadow position
                              ),

                            ],
                          ),

                        ),

                        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),

                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,30,0,0),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Appareils',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0e3664),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ],
              ),
            ),





          ],
        ),
      ),
      ),
    );
  }




















}