import 'dart:convert';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groupe/models/picture.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/apports.dart';
import 'package:groupe/screens/drawer_pages/invitation.dart';
import 'package:groupe/screens/drawer_pages/profileditor.dart';
import 'package:groupe/screens/login_page/auth_page.dart';
import 'package:groupe/utils/colors.dart';
import 'package:groupe/utils/constants.dart';
import '../../classes/application_user.dart';
import '../../components/dialogs/logout_dialog.dart';
import 'package:groupe/classes/navigation.dart';

import '../../models/customer.dart';
import '../../service/customer.dart';
import '../home_page/acceuil.dart';
import '../menu_page/acc.dart';
import 'apport_pages/testprof.dart';
import 'groupe2form.dart';
import 'information.dart';

class ProfilepageScreen extends StatefulWidget {
  ProfilepageScreen({Key? key, String? title}) : super(key: key);

  @override
  State<ProfilepageScreen> createState() => _ProfilepageScreenState();
}

class _ProfilepageScreenState extends State<ProfilepageScreen> {
  final double circleRadius = 100.0;

  final double circleBorderWidth = 8.0;

  late ApplicationUser applicationUser;

  var image = null;

  String? photo = '';

  Picture? picture;

  CustomerService customerService = CustomerService();

  late Customer customer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xffE0E0E0),
        child: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                padding: EdgeInsets.only(top: 30),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        GroupNavigation.destroy(context);
                        GroupNavigation.to(context, AcceuilScreen());
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      "Profil",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: circleRadius / 2.0,
                  ),

                  ///here we create space for the circle avatar to get ut of the box
                  child: Container(
                    height: 530.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 3.0),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 75.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: circleRadius / 5,
                            ),
                            FutureBuilder(
                                future: ApplicationUser.getConnectingUser(),
                                builder: (context, snap) {
                                  if (snap.hasData) {
                                    applicationUser =
                                        snap.data as ApplicationUser;
                                    return Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: applicationUser.fName == null &&
                                              applicationUser.lName == null
                                          ? const Text('')
                                          : applicationUser.fName == null &&
                                                  applicationUser.lName != null
                                              ? Text(
                                                  applicationUser.lName!
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : applicationUser.lName == null &&
                                                      applicationUser.fName !=
                                                          null
                                                  ? Text(
                                                      applicationUser.fName!
                                                          .capitalize(),
                                                      style: const TextStyle(
                                                          color: primaryColor,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Text(
                                                      applicationUser.fName!
                                                              .capitalize() +
                                                          " " +
                                                          applicationUser.lName!
                                                              .toUpperCase(),
                                                      style: const TextStyle(
                                                          color: primaryColor,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    );
                                  }
                                }),
                            FutureBuilder(
                                future: ApplicationUser.getConnectingUser(),
                                builder: (context, snap) {
                                  if (snap.hasData) {
                                    applicationUser =
                                        snap.data as ApplicationUser;
                                    return Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: applicationUser.id == null
                                            ? const Text('')
                                            : Text(
                                                StringUtils.addCharAtPosition(
                                                    ((int.tryParse(
                                                                applicationUser
                                                                    .id!)! +
                                                            10000000)
                                                        .toString()),
                                                    "-",
                                                    2,
                                                    repeat: true),
                                                style: const TextStyle(
                                                    color: secondaryColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ));
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    );
                                  }
                                }),
                            //Text('Anne DOE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0,  color: primaryColor),),
                            // Text('Seul on va plus vite, ensemble on va plus loin', style: TextStyle(fontWeight: FontWeight.bold,fontStyle :  FontStyle .italic, fontSize: 12.0, color: Colors.grey),),

                            SizedBox(
                              height: 30.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(
                                          Icons.edit_outlined,
                                          color: primaryColor,
                                          size: 25,
                                        ),
                                        title: Text(
                                          'Editer le profil',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Color(0xFF0e3664),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        onTap: () {
                                          GroupNavigation.destroy(context);
                                          GroupNavigation.to(
                                              context, EditProfilePage());
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.people_alt_outlined,
                                          color: Color(0xFF0e3664),
                                          size: 25,
                                        ),
                                        title: Text(
                                          'Créer un groupe',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Color(0xFF0e3664),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GroupApp2()),
                                          );
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.mail_outline_outlined,
                                          color: Color(0xFF0e3664),
                                          size: 25,
                                        ),
                                        title: Text(
                                          'Inviter un ami',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Color(0xFF0e3664),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InvitationScreen()),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(
                                          Icons.power_settings_new,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                        title: Text(
                                          'Déconnexion',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Color(0xFF0e3664),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return LogOutDialog(
                                                    onPressed: () async {
                                                  await ApplicationUser
                                                      .updateSavingModeUser(
                                                          false);
                                                  GroupNavigation.destroy(
                                                      context);
                                                  GroupNavigation.to(context,
                                                      const ConnectPage());
                                                });
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),

                ///Image Avatar
                Container(
                  width: 200,
                  height: 137,
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
                        child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: FutureBuilder(
                          future: getPicture(),
                          builder: (context, snap) {
                            if (snap.hasData) {
                              image = snap.data;
                              return image != ''
                                  ? CircleAvatar(
                                      radius: 110,
                                      backgroundImage: MemoryImage(image),
                                    )
                                  : CircleAvatar(
                                      radius: 110,
                                      backgroundImage:
                                          AssetImage('images/hands.png'),
                                    );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future getPicture() async {
    var data = null;
    ApplicationUser applicationUser = await ApplicationUser.getConnectingUser();
    await customerService.getCustomer(applicationUser.id!).then((value) async {
      if (value is Customer) {
        picture = value.picture;
        photo = picture?.url!;
        if (photo != null) {
          await customerService.getPicture(picture?.url!).then((val) {
            data = val;
          });
        }else{
          data = '';
        }
      }
    });
    return data;
  }
}
