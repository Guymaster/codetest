
import 'package:flutter/cupertino.dart';
import '../../screens/sidepage/side_page.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class NotificationPage extends StatelessWidget {

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(),
      body: ListView(),
    );
  }
  PreferredSizeWidget appBar(){
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      bottomOpacity: 2,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu,
                color: primaryColor,
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
              color: primaryColor,
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
              color: primaryColor,
              size: 37,
            ),
            onPressed: null,
          ),
        ),
      ],
      centerTitle: true,
    );

  }



}

