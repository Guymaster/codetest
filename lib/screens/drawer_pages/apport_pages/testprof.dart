import 'dart:io';

import 'package:flutter/material.dart';
import 'package:groupe/classes/application_user.dart';
import 'package:groupe/components/buttons/async_button.dart';
import 'package:groupe/components/dialogs/content_dialog.dart';
import 'package:groupe/models/customer.dart';
import 'package:groupe/models/customers_credential.dart';
import 'package:groupe/screens/drawer_pages/apport_pages/setting.dart';
import 'package:groupe/service/customer.dart';
import 'package:groupe/service/customers_credential.dart';
import 'package:groupe/service/user.dart';
import 'package:groupe/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../../classes/navigation.dart';
import '../../../components/toasts/default_toast.dart';
import '../../../models/picture.dart';
import '../profilepage.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  List textfieldsStrings = [
    "", //lastName
    "", //firstName
    "", //email
    "", //telephone
  ];

  GroupSnack groupSnack = GroupSnack();

  var imageOld = null;

  late String lastnamevalue = "";
  late String firstnamevalue = "";
  late String emailvalue = "";
  late String phonevalue = "";

  final _firstnamekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();

  CustomerService customerService = CustomerService();
  CustomersCredentialsService customersCredentialsService =
      CustomersCredentialsService();

  late Customer customer;

  File? image;
  Picture? picture;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              GroupNavigation.destroy(context);
              GroupNavigation.to(context, ProfilepageScreen());
            },
          ),
        ),
        body: FutureBuilder(
            future: getInformation(),
            builder: (context, snap) {
              if (snap.hasData) {
                customer = snap.data as Customer;
                return Container(
                  color: Color(0xFF0e3664),
                  padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "Editer le Profil",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Color(0xFF0e3664)),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 10))
                                    ],
                                    shape: BoxShape.circle,
                                    image: imageOld != null
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: MemoryImage(imageOld))
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/imginfo.png'))),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                      onTap: () {
                                        _showCameraSourceBottom();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          color: secondaryColor,
                                        ),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        buildTextField(
                          "Nom",
                          customer.lastName!,
                          Icons.person,
                          false,
                          size,
                          (valuelastname) {
                            lastnamevalue = valuelastname;
                            if (valuelastname.length <= 2) {
                              groupSnack.buildSnack(
                                  'Invalide nom', context, size, true);
                              return '';
                            }
                            return null;
                          },
                          _lastNamekey,
                          0,
                          isDarkMode,
                        ),
                        buildTextField(
                          "Prénom (s)",
                          customer.names!,
                          Icons.person_outlined,
                          false,
                          size,
                          (valuefirstname) {
                            firstnamevalue = valuefirstname;
                            if (valuefirstname.length <= 2) {
                              groupSnack.buildSnack(
                                  'Invalide prenom', context, size, true);
                              return '';
                            }
                            return null;
                          },
                          _firstnamekey,
                          1,
                          isDarkMode,
                        ),
                        buildTextField(
                          "E-mail",
                          customer.emails!,
                          Icons.email_outlined,
                          false,
                          size,
                          (valueemail) {
                            emailvalue = valueemail;
                            if (valueemail.length < 5) {
                              groupSnack.buildSnack(
                                  'Invalide email', context, size, true);
                              return '';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                .hasMatch(valueemail)) {
                              groupSnack.buildSnack(
                                  'Invalide email', context, size, true);
                              // _emailKey.currentWidget.

                              // print("email value-*"+emailvalue);
                              return '';
                            }
                            //return null;
                          },
                          _emailKey,
                          2,
                          isDarkMode,
                        ),
                        buildTextField(
                          "Téléphone",
                          customer.phones!,
                          Icons.phone,
                          false,
                          size,
                          (valuephone) {
                            phonevalue = valuephone;
                            if (valuephone.length <= 10) {
                              groupSnack.buildSnack(
                                  'Invalide phone number', context, size, true);
                              return '';
                            }
                            return null;
                          },
                          _phoneKey,
                          3,
                          isDarkMode,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                GroupNavigation.destroy(context);
                                GroupNavigation.to(
                                    context, ProfilepageScreen());
                              },
                              child: Text("Annuler",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.white)),
                            ),
                            saveButton(context)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Future<Customer> getInformation() async {
    Customer cc = Customer.empty();
    ApplicationUser applicationUser = await ApplicationUser.getConnectingUser();
    await customerService.getCustomer(applicationUser.id!).then((value) async {
      if (value is Customer) {
        cc = value;
        picture = value.picture;
        await customerService.getPicture(picture?.url!).then((val) {
          imageOld = val;
        });
      }
    });
    return cc;
  }

  //save user locally
  Future doSaveUser() async {
    UserService userService = UserService();
    ApplicationUser applicationUser = await ApplicationUser.getConnectingUser();
    await customersCredentialsService.getCustomerCredentialByID(applicationUser.id!).then((value) async {
      if (value is CustomerCredential) {
        Future.wait([userService.saveUserLocally(true, value)]);
      }
    });
  }

  Future<dynamic> getImage(String source) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
        source: source == 'camera'
            ? ImageSource.camera
            : ImageSource
                .gallery); //This opens the gallery and lets the user pick the image
    if (pickedFile == null)
      return; //Checks if the user did actually pick something
    setState(() {
      image = (File(pickedFile.path));
    });
    ApplicationUser applicationUser = await ApplicationUser.getConnectingUser();
    await customerService.getCustomer(applicationUser.id!).then((value) async {
      await Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
        await customerService.changePhoto(value, image!.path).then((value) {
          if (value is Picture) {
            const Center(child: CircularProgressIndicator());
            groupSnack.buildSnack("Photo mise a jour avec success!", context,
                MediaQuery.of(context).size, false);
          } else {
            groupSnack.buildSnack("Erreur de mise a jour. Merci de reessayer!",
                context, MediaQuery.of(context).size, true);
          }
        });
      });
    });

    return image;
  }

  Widget saveButton(BuildContext context){
    return GroupAsyncButton(
      loadingColor: secondaryColor,
      onPressed: () async{
        if (_lastNamekey.currentState!.validate()) {
          if (_firstnamekey.currentState!.validate()) {
            if (_emailKey.currentState!.validate()) {
              if (_phoneKey.currentState!.validate()) {
                customer.names = firstnamevalue;
                customer.lastName = lastnamevalue;
                customer.emails = emailvalue;
                customer.phones = phonevalue;

                await customerService
                    .editCustomer(customer)
                    .then((value1) async {
                  if (value1 is Customer) {
                    await doSaveUser();
                    showDialog(
                        context: context,
                        builder:
                            (BuildContext context) {
                          return AdvanceCustomAlert();
                        });
                  } else {
                    groupSnack.buildSnack(
                        "Erreur de mise a jour. Merci de reessayer!",
                        context,
                        MediaQuery.of(context).size,
                        true);
                  }
                });
              }
            }
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width/2.2,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: secondaryColor, width: 2),
            borderRadius: BorderRadius.circular(30),
            color: secondaryColor
        ),
        child: Center(
          child: Text(
            "Enregistrer",
            style: const TextStyle(
                fontSize: 14,
                letterSpacing: 2.2,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;

  Widget buildTextField(
    String hintText,
    String initialValue,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.all(
        19.0,
      ),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            initialValue: initialValue,
            style: TextStyle(color: primaryColor),
            onChanged: (value) {
              setState(() {
                textfieldsStrings[stringToEdit] = value;
              });
            },
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: primaryColor,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(
                12.0,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.001,
                ),
                child: Icon(
                  icon,
                  color: primaryColor,
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pwVisible = !pwVisible;
                          });
                        },
                        child: pwVisible
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: primaryColor,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: primaryColor,
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  void _showCameraSourceBottom() {
    showDialog(
        context: context,
        builder: (builder) {
          return RoundedAlertBox(
            content: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 70,
                    height: 100,
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await getImage('gallery');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('images/gallery.png'),
                          const Text(
                            'Gallery',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 100,
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await getImage('camera');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('images/camera.png'),
                          Text(
                            'Camera',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            buttonTitle: 'Cancel',
            onPressed: () {},
            title: 'Choose Photo source',
          );
        });
  }
}

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
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
                    Text(
                      'Votre profil a été mis à jour avec succès.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Merci!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      onPressed: () {
                        GroupNavigation.destroy(context);
                        GroupNavigation.to(context, ProfilepageScreen());
                      },
                      color: Colors.green,
                      child: Text(
                        'Ok',
                        style: TextStyle(color: Colors.white),
                      ),
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
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 50,
                  ),
                )),
          ],
        ));
  }
}
