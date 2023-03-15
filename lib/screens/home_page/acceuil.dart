import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/information.dart';
import 'package:groupe/screens/menu_page/acc.dart';
import 'package:groupe/screens/menu_page/chat.dart';
import 'package:groupe/screens/menu_page/detail.dart';
import 'package:groupe/screens/menu_page/member.dart';
import 'package:groupe/screens/menu_page/planning.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/apports.dart';
import 'package:groupe/classes/navigation.dart';

import '../bottompage/bottom_page.dart';
import '../drawer_pages/profilepage.dart';
import '../sidepage/side_page.dart';

import '../../utils/colors.dart';

class AcceuilScreen extends StatefulWidget {
  @override
  _AcceuilScreenState createState() => new _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> {
  int pageIndex = 0;

  final pages = [
    const AccScreen(),
    const ChatScreen(),
    const MemberScreen(),
    const PlanningScreen(),
    const DetailScreen(),
    const ApportScreen(),
  ];

  String text = "Initial Text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: new AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        bottomOpacity: 2,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,
                  color: primaryColor, size: 30 // Changing Drawer Icon Size
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
              onPressed: () {
                GroupNavigation.destroy(context);
                GroupNavigation.to(context, ProfilepageScreen());
              },
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          // new
          fixedColor: secondaryColor,
          currentIndex: pageIndex,
          onTap: (int index) {
            setState(() {
              this.pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home,
                    )
                  : const Icon(
                      Icons.home_outlined,
                    ),
              label: 'Acceuil',
            ),
            BottomNavigationBarItem(
              icon: pageIndex == 1
                  ? const Icon(Icons.question_answer)
                  : const Icon(Icons.question_answer_outlined),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: pageIndex == 2
                  ? const Icon(Icons.groups)
                  : const Icon(Icons.groups_outlined),
              label: "Membres",
            ),
            BottomNavigationBarItem(
              icon: pageIndex == 3
                  ? const Icon(Icons.event)
                  : const Icon(Icons.event_outlined),
              label: "Planning",
            ),
            BottomNavigationBarItem(
              icon: pageIndex == 4
                  ? const Icon(Icons.more_horiz_rounded)
                  : const Icon(Icons.more_horiz_rounded),
              label: "Détails",
            )
          ]),
    );
  }
}
