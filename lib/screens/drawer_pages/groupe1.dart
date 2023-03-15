
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/profilepage.dart';
import '../../screens/bottompage/bottom_page.dart';
import '../../screens/home_page/acceuil.dart';
import '../../screens/sidepage/side_page.dart';
import 'groupe2form.dart';

class groupeformScreen extends StatelessWidget {
  const  groupeformScreen({Key? key}) : super(key: key);




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
                      'CREER LE GROUPE',
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
                          hintText: 'Nom du groupe',
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
                          hintText: 'Logo du groupe',
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
                          builder: (context) => GroupApp2()),
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
