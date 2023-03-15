
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/profilepage.dart';
import 'package:groupe/screens/menu_page/acc.dart';
import '../../screens/sidepage/side_page.dart';
import 'invitation.dart';


class GroupApp2 extends StatefulWidget {
  @override
  _GroupeformScreenState createState() => _GroupeformScreenState();
}

class _GroupeformScreenState extends State<GroupApp2> {


  List<Map> memberschoice = [
    {"name": "Anne DOE", "isChecked": false},
    {"name": "Ange DOE", "isChecked": false},
    {"name": "Jacques DOE", "isChecked": false,},
    {"name": "Leila JOHNSON", "isChecked": false,},

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF0e3664),
      drawer: SideMenu(),
      appBar: AppBar(
        toolbarHeight: 80.0,
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

      body: SingleChildScrollView(

        child: Container(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              Padding(
                padding: const EdgeInsets.all(55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      'CREER UN GROUPE (2)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,

                      ),
                    ),

                  ],
                ),
              ),



              Padding(padding:  EdgeInsets.all(25),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Stack(
                      overflow: Overflow.visible,
                      alignment: AlignmentDirectional.topCenter,
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height:525.0,
                          width: 380.0,
                          decoration: BoxDecoration(
                            color: Colors.white,

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [




                              // The checkboxes will be here
                              Column(
                                  children:memberschoice.map((members) {
                                    return CheckboxListTile(
                                        value: members["isChecked"],
                                        title: Text(members["name"]),
                                        onChanged: (newValue) {
                                          setState(() {
                                            members["isChecked"] = newValue;
                                          });
                                        });
                                  }).toList()),

                              // Display the result here
                              const SizedBox(height: 20),
                              const Divider(),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 93, vertical: 20),

                                    child: ElevatedButton(

                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>InvitationScreen()),
                                        );
                                      },
                                      child: Text('INVITER',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500
                                          )
                                      ),
                                      style: ElevatedButton.styleFrom(

                                        fixedSize: const Size(200, 50),
                                        primary: Color(0xFF0bfb0b),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        elevation: 15.0,
                                      ),
                                    ),

                                  )
                                ],

                              ),

                              const SizedBox(height: 25),
                              Wrap(
                                children: memberschoice.map((member) {
                                  if (member["isChecked"] == true) {
                                    return Card(
                                      elevation: 3,
                                      color:  Color(0xFF0e3664),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          member["name"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),

                                        ),
                                      ),
                                    );
                                  }

                                  return Container();
                                }).toList(),
                              )
                            ]

                            ),
                          ),



                        ),
                        Positioned(
                          top: -50,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            height: 70.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFede8e8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Liste des contacts',

                                style: TextStyle(
                                  color: Color(0xFF0e3664),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                          ),
                        )
                      ],
                    )





                  ],


                ),
              ),



              Padding(
                padding: EdgeInsets.all(10.0),

                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>ProfilepageScreen()),
                    );
                  },
                  child: Text('CREER',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      )
                  ),
                  style: ElevatedButton.styleFrom(

                    fixedSize: const Size(200, 50),
                    primary: Color(0xFF0bfb0b),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 15.0,
                  ),
                ),

              )

            ],





          ),

        ),
      ),






    );
  }
}


