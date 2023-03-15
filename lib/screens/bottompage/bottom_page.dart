import 'package:flutter/material.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/apports.dart';
import 'package:groupe/screens/home_page/acceuil.dart';

import '../drawer_pages/information.dart';
import '../menu_page/acc.dart';
import '../menu_page/chat.dart';
import '../menu_page/detail.dart';
import '../menu_page/member.dart';
import '../menu_page/planning.dart';
import '../../utils/colors.dart';

class BottomNavBarSection extends StatefulWidget {
  @override
  _BottomNavBarSectionState createState() => _BottomNavBarSectionState();
}



class _BottomNavBarSectionState extends State<BottomNavBarSection> {
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
    return BottomNavigationBar(

        unselectedItemColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor, // new
        fixedColor: secondaryColor,
        currentIndex: pageIndex,
        onTap: (int index) {
          setState(() {
            this.pageIndex = index;
          }
          );

        },

        items: [
          BottomNavigationBarItem(
            icon: pageIndex==0

                ? const Icon(
              Icons.home,
            )
                : const Icon(
              Icons.home_outlined,

            ),

            label: 'Acceuil',

          ),

          BottomNavigationBarItem(
            icon: pageIndex==1

                ? const Icon(
                Icons.question_answer
            )
                : const Icon(
                Icons.question_answer_outlined),

            label: "Chats",



          ),

          BottomNavigationBarItem(
            icon: pageIndex==2

                ? const Icon(
                Icons.groups
            )

                : const Icon(
                Icons.groups_outlined),

            label: "Membres",
          ),

          BottomNavigationBarItem(
            icon: pageIndex==3

                ? const Icon(
                Icons.event)

                : const Icon(
                Icons.event_outlined),

            label:"Planning",
          ),

          BottomNavigationBarItem(
            icon: pageIndex==4
                ? const Icon(
                Icons.more_horiz_rounded)

                : const Icon(
                Icons.more_horiz_rounded),

            label: "Détails",
          )
        ]

    );


  }

}