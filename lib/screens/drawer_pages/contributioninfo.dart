
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/exo.dart';
import 'package:groupe/screens/drawer_pages/groupe2form.dart';
import 'package:groupe/screens/drawer_pages/profilepage.dart';
import '../../screens/bottompage/bottom_page.dart';
import '../../screens/home_page/acceuil.dart';
import '../../screens/sidepage/side_page.dart';


class ContributionScreen extends StatefulWidget {
  @override
  _ContributionScreenState createState() => _ContributionScreenState();
}

class _ContributionScreenState extends State<ContributionScreen> {


  List<Map> memberschoice = [
    {"name": "Anne DOE", "isChecked": false},
    {"name": "Ange DOE", "isChecked": false},
    {
      "name": "Jacques DOE",
      "isChecked": false,
    },

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
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      'CREER UNE CONTRIBUTION',
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

              Padding(padding:  EdgeInsets.all(15),

                child: Row(
                  children: <Widget>[

                    Container(

                      width: 370.0,
                      height: 55.0,

                      child:TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 2.0,
                          color: Colors.white,
                        ),

                        decoration: InputDecoration(
                          hintText: 'Type de contribution',
                          hintStyle: TextStyle(
                            color: Colors.white, // <-- Change this
                            fontSize: 20,
                            fontWeight: FontWeight.w500,

                          ),
                          labelStyle: new TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),

                        ),
                      ),
                    ),





                  ],


                ),
              ),

              Padding(padding:  EdgeInsets.all(15),

                child: Row(
                  children: <Widget>[

                    Container(

                      width: 370.0,
                      height: 55.0,

                      child:TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 2.0,
                          color: Colors.white,
                        ),

                        decoration: InputDecoration(
                          hintText: 'Image',
                          hintStyle: TextStyle(
                            color: Colors.white, // <-- Change this
                            fontSize: 20,
                            fontWeight: FontWeight.w500,

                          ),
                          labelStyle: new TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),

                        ),
                      ),
                    ),





                  ],


                ),
              ),

              Padding(padding:  EdgeInsets.all(15),

                child: Row(
                  children: <Widget>[

                    Container(

                      width: 370.0,
                      height: 55.0,

                      child:TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 2.0,
                          color: Colors.white,
                        ),

                        decoration: InputDecoration(
                          hintText: 'Ajouter des membres',
                          hintStyle: TextStyle(
                            color: Colors.white, // <-- Change this
                            fontSize: 20,
                            fontWeight: FontWeight.w500,

                          ),
                          
                          labelStyle: new TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),


                          suffixIcon: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    print('add button pressed');
                                  },
                                  icon: Icon(
                                      Icons.add_circle_outline_outlined,
                                      color: Colors.white,
                                      size: 35.0,

                                  ),
                                ),

                              ],
                            ),

                        ),


                      ),
                    ),

                    ),




                  ],


                ),
              ),


              Padding(padding:  EdgeInsets.only(top: 60.0),

                child: Column(
                  children: <Widget>[

                    Stack(
                      overflow: Overflow.visible,
                      alignment: AlignmentDirectional.topCenter,
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height: 350.0,
                          width: 370.0,
                          decoration: BoxDecoration(
                              color: Colors.white,

                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                              const SizedBox(height: 10),
                              const Divider(),
                              const SizedBox(height: 10),

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
                              const SizedBox(height: 10),
                              const Divider(),
                              const SizedBox(height: 20),
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
                            ]),
                          ),













                        ),
                        Positioned(
                          top: -50,
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            height: 70.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFede8e8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Liste des membres',

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





              Padding(padding:  EdgeInsets.all(20),

                child: Row(
                  children: <Widget>[

                    Container(
                      padding:  EdgeInsets.all(15),
                      width: 370.0,
                      height: 100.0,
                      color: Colors.white,
                      child:TextField(

                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle: TextStyle(
                            color: Colors.grey, // <-- Change this
                            fontSize: 20,
                            fontWeight: FontWeight.w500,


                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3,
                              )
                          ),
                        ),

                      ),

                    ),


                  ],


                ),
              ),



              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 60),

                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>GroupApp2()),
                    );
                  },
                  child: Text('Suivant',
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


