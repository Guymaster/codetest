import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../bottompage/bottom_page.dart';
import '../../sidepage/side_page.dart';
import 'exo.dart';
import 'nature.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/numeraire.dart';

class ApportScreen extends StatelessWidget {
  const ApportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:SideMenu(),
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
                onPressed: null,
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: SafeArea(
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/apport.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Expanded(
                          child: Text(
                            'Apports',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Row(
                            children: <Widget>[

                              Expanded(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xFF0e3664), width: 2
                                    ),
                                  ),
                                  splashColor: Colors.black54,
                                  padding: EdgeInsets.all(20.0),
                                  elevation:10.0,
                                  onPressed: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => NumerairScreen()),
                                    );

                                  },
                                  child: Text("Numéraire",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  color: Color(0xFFe6e6e6),
                                  textColor: Color(0xFF0e3664),

                                ),
                              ),
                              Expanded(child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFF0e3664), width: 2
                                  ),
                                ),
                                splashColor: Colors.black54,
                                padding: EdgeInsets.all(20.0),
                                elevation:10.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NatureScreen()),
                                  );

                                },
                                child: Text("Nature",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),

                                ),
                                color: Color(0xFFe6e6e6),
                                textColor:  Color(0xFF0e3664),
                              ),
                              ),

                            ],
                          )),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),





      bottomNavigationBar: BottomNavBarSection(),

    );
  }

}
