import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'acc.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();

}



class _DetailScreenState extends State<DetailScreen> {
  List<String> _contributions = ["Contribution Scolaire", "Contribution Appareils", "Contribution Immobilier", "Contribution Fêtes"];

  String? _selectedContrib;


  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xf6f8fb),
      child: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/details_contri.png'), fit: BoxFit.cover),
            ),


          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                    padding: const EdgeInsets.only(top: 350.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xFF0e3664), width: 2,),
                            ),
                            splashColor: Colors.black54,
                            padding: EdgeInsets.all(20.0),
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccScreen()),
                              );
                            },

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(

                                    Icons.group,
                                    size: 43,
                                ), // icon
                                Text("Membres contributions "), // text
                              ],


                            ),

                            color: Color(0xFFe6e6e6),
                            textColor: Color(0xFF0e3664),

                          ),

                        ),
                        Expanded(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xFF0e3664), width: 2),
                            ),
                            splashColor: Colors.black54,
                            padding: EdgeInsets.all(20.0),
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccScreen()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.monetization_on_outlined,
                                  size: 43,
                                ), // icon
                                Text("Solde"), // text
                              ],
                            ),
                            color: Color(0xFF82ca9c),
                            textColor: Color(0xFF0e3664),
                          ),
                        ),
                      ],
                    )),


                Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: Row(
                      children: <Widget>[


                        Expanded(

                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                 color: Color(0xFF0e3664),),
                            ),
                            splashColor: Colors.black54,
                            padding: EdgeInsets.all(5.0),
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccScreen()),
                              );
                            },

                            child: Column(


                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                Text("Numéraire",
                                  style: TextStyle(
                                  fontSize: 10,
                                ),
                                ),// text
                              ],


                            ),

                            color: Color(0xFFe6e6e6),
                            textColor: Color(0xFF0e3664),

                          ),

                        ),
                        Expanded(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFF0e3664), width: 2,),
                            ),
                            splashColor: Colors.black54,
                            padding: EdgeInsets.all(5.0),
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccScreen()),
                              );
                            },

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                Text("Nature",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),

                                ), // text
                              ],


                            ),

                            color: Color(0xFFe6e6e6),
                            textColor: Color(0xFF0e3664),

                          ),

                        ),

                        Expanded(

                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFF0e3664),),
                            ),
                            splashColor: Colors.black54,
                            padding: EdgeInsets.all(5.0),
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccScreen()),
                              );
                            },

                            child: Column(


                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                Text("Numéraire",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),// text
                              ],


                            ),

                            color: Color(0xFFe6e6e6),
                            textColor: Color(0xFF0e3664),

                          ),

                        ),
                        Expanded(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFF0e3664), width: 2,),
                            ),
                            splashColor: Colors.black54,
                            padding: EdgeInsets.all(5.0),
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccScreen()),
                              );
                            },

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                Text("Nature",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),

                                ), // text
                              ],


                            ),

                            color: Color(0xFFe6e6e6),
                            textColor: Color(0xFF0e3664),

                          ),

                        ),
                      ],
                    )),





              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding:
                  EdgeInsets.only(top: circleRadius / 2.0, ),  ///here we create space for the circle avatar to get ut of the box
                  child: Center(
                    child: Container(

                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 130.0, bottom: 10.0),
                            child: DropdownButton<String>(
                              onChanged: (value) {
                                setState(() {
                                  _selectedContrib = value;
                                });
                              },
                              value: _selectedContrib,

                              // Hide the default underline
                              underline: Container(

                              ),
                              hint: Center(
                                  child: Text(
                                    'Choisissez une contribution',textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.white),
                                  )),
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                              ),
                              isExpanded: true,

                              // The list of options
                              items: _contributions
                                  .map((e) => DropdownMenuItem(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 18,
                                      color: Color(0xFF0e3664),

                                    ),
                                  ),
                                ),
                                value: e,
                              ))
                                  .toList(),

                              // Customize the selected item
                              selectedItemBuilder: (BuildContext context) => _contributions
                                  .map((e) => Center(
                                child: Text(
                                  e,textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                                  .toList(),
                            ),

                          ),
                          Text('Description', style: TextStyle(fontWeight: FontWeight.bold,fontStyle :  FontStyle .italic, fontSize: 12.0, color: Colors.white),),

                        ],


                      ),

                    ),
                  ),
                ),



                ///Image Avatar
                Container(
                  width:300,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
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
                          backgroundColor: Colors.white,
                          radius: 100,
                          child: CircleAvatar(
                            radius: 110,
                            backgroundImage: AssetImage('images/electro.png'),
                            child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                          CupertinoIcons.camera,
                                          color: Color(0xFF0e3664),
                                      ),
                                    ),
                                  ),
                                ]
                            ),
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
