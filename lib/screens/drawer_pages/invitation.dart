
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/groupe2form.dart';
import 'package:groupe/screens/drawer_pages/profilepage.dart';
import 'package:groupe/screens/menu_page/acc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../screens/home_page/acceuil.dart';
import '../../screens/sidepage/side_page.dart';

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({Key? key}) : super(key: key);




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
                      'INVITATION',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,

                      ),
                    ),

                  ],
                ),
              ),


              Padding(
                padding: EdgeInsets.only(right: 157),


                child: Column(

                  children: <Widget>[

                    Text(
                      'Invitation par (Sms)',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),

                  ],
                ),
              ),



              Padding(padding:  EdgeInsets.all(27),

                child: Row(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(top: 22) ,
                      width: 340.0,
                      height: 55.0,

                      child:IntlPhoneField(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 2.0,
                          color: Colors.white,
                        ),

                        decoration: InputDecoration(
                          hintText: 'Téléphone',
                          hintStyle: TextStyle(
                            color: Colors.white, // <-- Change this
                            fontSize: 20,
                            fontStyle :  FontStyle .italic,
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


              Padding(
                padding: EdgeInsets.all(10),

                child:  RaisedButton(

                  color: Color(0xFF0bfb0b),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 15.0,
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 17),

                  child: Text('Inviter',
                      style: TextStyle(
                          color:Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      )

                  ),
                  onPressed: () {
                    showDialog(context: context,
                        builder: (BuildContext context) {
                          return AdvanceCustomAlert();
                        });
                  },),

              ),






              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 157, 0),


                child: Column(

                  children: <Widget>[

                    Text(
                      'Invitation par (Email)',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),

                  ],
                ),
              ),



              Padding(padding:  EdgeInsets.all(27),

                child: Row(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(top: 22) ,
                      width: 340.0,
                      height: 55.0,

                      child:TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 2.0,
                          color: Colors.white,
                        ),

                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.white, // <-- Change this
                            fontSize: 20,
                            fontStyle :  FontStyle .italic,
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


              Padding(
                padding: EdgeInsets.all(10),

                child:  RaisedButton(

                  color: Color(0xFF0bfb0b),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 15.0,
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 17),

                  child: Text('Inviter',
                      style: TextStyle(
                          color:Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      )

                  ),
                  onPressed: () {
                    showDialog(context: context,
                        builder: (BuildContext context) {
                          return AdvanceCustomAlert();
                        });
                  },),

              )







            ],





          ),

        ),
      ),






    );
  }
}

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 800,
              height: 335,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [

                    Text('Votre invitation a été envoyer avec succès.', textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,


                      ),),
                    SizedBox(height: 30,),

                    Text('Merci!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 40,),
                    RaisedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>GroupApp2()),
                      );
                    },
                      color: Colors.green,
                      child: Text('Ok', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,

                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 60,
                  child: Icon(Icons.check, color:Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}