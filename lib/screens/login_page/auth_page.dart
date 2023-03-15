import 'dart:convert';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:groupe/components/buttons/async_button.dart';
import 'package:groupe/components/edit_texts/card_formatter.dart';
import 'package:groupe/components/edit_texts/default_edit_text.dart';
import 'package:groupe/components/email/send_mail.dart';
import 'package:groupe/components/toasts/default_toast.dart';
import 'package:groupe/screens/login_page/forgot_password_page.dart';
import 'package:groupe/screens/login_page/number.dart';
import 'package:groupe/models/customers_credential.dart';
import 'package:groupe/screens/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:universal_io/io.dart';
import 'dart:convert';
import 'package:groupe/utils/constants.dart';
import 'package:groupe/classes/navigation.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../../models/customer.dart';
import '../../service/customer.dart';
import '../../utils/colors.dart';
import '../../service/customers_credential.dart';
import '../../service/user.dart';
import '../home_page/acceuil.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  bool checkedValue = false;
  bool register = false;
  List textfieldsStrings = [
    "", //firstName
    "", //lastName
    "", //email
    "", //telephone
    "", //userName
    "", //password
    "", //confirmPassword
  ];

  GroupSnack groupSnack = GroupSnack();

  late String telephonevalue;
  late String usernameorcodevalue;
  late String passwordvalue;
  var lastnamevalue = "";
  var firstnamevalue = "";
  var emailvalue = "";
  var usernamevalue = "";

  CustomerService customerService = CustomerService();
  CustomersCredentialsService customersCredentialsService =
      CustomersCredentialsService();

  Customer customer = Customer.signUp(
      names: null,
      lastName: null,
      createdDate: null,
      phones: null,
      emails: null,
      type: null,
      status: null,
      categories: null);
  CustomerCredential customerCredential = CustomerCredential.empty();

  TextEditingController emailTextController = new TextEditingController();

  final _firstnamekey = GlobalKey<FormState>();
  final _userorcodekey = GlobalKey<FormState>();
  final _lastNamekey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();

  String identificationType = 'username';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customer.createdDate = DateTime.now().toString();
    customer.type = 'webbuyer';
    customer.status = '1';
    customer.categories = '7';
    customer.size = 'other';
    customer.addFrom = 'groupe.mobile';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xff151f2c) : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/connexion.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(
                          child:
                              Image.asset('images/logowhite.png', width: 200),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(
                          child: register
                              ? Text(
                                  'Créer un compte',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: primaryPolice),
                                )
                              : Text(
                                  'Bienvenue',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: primaryPolice),
                                ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                      ),
                      register
                          ? buildTextField(
                              "Nom",
                              Icons.person_outlined,
                              false,
                              size,
                              (valuename) {
                                lastnamevalue = valuename;
                                if (valuename.length <= 2) {
                                  groupSnack.buildSnack(
                                      'Invalide nom', context, size, true);
                                  return '';
                                }
                                return null;
                              },
                              _lastNamekey,
                              0,
                              isDarkMode,
                            )
                          : Container(),
                      register
                          ? buildTextField(
                              "Prénom (s)",
                              Icons.person_outlined,
                              false,
                              size,
                              (valuename) {
                                firstnamevalue = valuename;
                                if (valuename.length <= 2) {
                                  groupSnack.buildSnack(
                                      'Invalide prenom', context, size, true);
                                  return '';
                                }
                                return null;
                              },
                              _firstnamekey,
                              1,
                              isDarkMode,
                            )
                          : Container(),
                      register
                          ? buildTextField(
                              "Adresse Email",
                              Icons.email_outlined,
                              false,
                              size,
                              (valuemail) {
                                emailvalue = valuemail;
                                if (valuemail.length < 5) {
                                  groupSnack.buildSnack(
                                      'Invalide email', context, size, true);
                                  return '';
                                }

                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                    .hasMatch(valuemail)) {
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
                            )
                          : Container(),
                      register
                          ? SizedBox(
                              // <-- SEE HERE
                              width: 365,
                              child: IntlPhoneField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  labelText: 'Votre numéro de téléphone',
                                  focusColor: Colors.white,
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                ),
                                onChanged: (phone) {
                                  telephonevalue = phone.completeNumber;
                                },
                                onCountryChanged: (country) {
                                  print('Country changed to: ' + country.name);
                                },
                              ),
                            )
                          : Container(),
                      Form(
                        child: register
                            ? buildTextField(
                                "Nom d'utilisateur",
                                Icons.person_outlined,
                                false,
                                size,
                                (valueusername) {
                                  usernamevalue = valueusername;
                                  if (valueusername.length <= 2) {
                                    groupSnack.buildSnack(
                                        'Invalide identifiant',
                                        context,
                                        size,
                                        size);
                                    return '';
                                  }
                                  return null;
                                },
                                _usernameKey,
                                4,
                                isDarkMode,
                              )
                            : DefaultEditText(
                                textInputFormatter: identificationType == 'azId'
                                    ? [
                                        CardFormatter(
                                            sample: 'xx-xx-xx-xx',
                                            separator: '-')
                                      ]
                                    : [],
                                hintText: "Code ID/Nom utilisateur",
                                onChanged: (v) {
                                  usernameorcodevalue = v;
                                  if (int.tryParse(v.replaceAll('-', ''))
                                      is int) {
                                    setState(() {
                                      identificationType = 'azId';
                                    });
                                  } else {
                                    setState(() {
                                      identificationType = 'username';
                                    });
                                  }
                                },
                                prefixIcon: const Icon(
                                  Icons.person_outlined,
                                  color: primaryColor,
                                  size: 22,
                                ),
                              ),
                      ),
                      Form(
                        child: buildTextField(
                          "Mot de passe",
                          Icons.lock_outline,
                          true,
                          size,
                          (valuepassword) {
                            passwordvalue = valuepassword;
                            if (valuepassword.length < 6) {
                              groupSnack.buildSnack(
                                  'Invalid mot de passe', context, size, true);
                              return '';
                            }
                            return null;
                          },
                          _passwordKey,
                          6,
                          isDarkMode,
                        ),
                      ),
                      Form(
                        child: register
                            ? buildTextField(
                                "Confirmer le mot de passe",
                                Icons.lock_outline,
                                true,
                                size,
                                (valuepassword) {
                                  if (valuepassword != textfieldsStrings[6]) {
                                    groupSnack.buildSnack(
                                        'Les mots de passe doivent correspondre',
                                        context,
                                        size,
                                        true);
                                    return '';
                                  }
                                  return null;
                                },
                                _confirmPasswordKey,
                                7,
                                isDarkMode,
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.015,
                          vertical: size.height * 0.025,
                        ),
                        child: register
                            ? CheckboxListTile(
                                title: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "En créant un compte, vous acceptez nos ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * 0.015,
                                            fontFamily: primaryPolice),
                                      ),
                                      WidgetSpan(
                                        child: InkWell(
                                          onTap: () {
                                            // ignore: avoid_print
                                            print('conditions d\'utilisation');
                                          },
                                          child: Text(
                                            "Conditions d'utilisation",
                                            style: TextStyle(
                                                color: Colors.white,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: size.height * 0.015,
                                                fontFamily: primaryPolice),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: " et ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * 0.015,
                                            fontFamily: primaryPolice),
                                      ),
                                      WidgetSpan(
                                        child: InkWell(
                                          onTap: () {
                                            // ignore: avoid_print
                                            print(
                                                'politique de confidentialité');
                                          },
                                          child: Text(
                                            "Politique de confidentialité",
                                            style: TextStyle(
                                                color: Colors.white,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: size.height * 0.015,
                                                fontFamily: primaryPolice),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                activeColor: primaryColor,
                                value: checkedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValue = newValue!;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage()),
                                  );
                                },
                                child: Text(
                                  "Mot de passe oublié?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      fontSize: size.height * 0.02,
                                      fontFamily: primaryPolice),
                                ),
                              ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: register
                            ? EdgeInsets.only(top: size.height * 0.025)
                            : EdgeInsets.only(top: size.height * 0.035),
                        child: register ? regButton(context) : logButton(context)
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                          top: register
                              ? size.height * 0.025
                              : size.height * 0.15,
                        ),
                        child: Row(
                          //TODO: replace text logo with your logo
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: register
                                  ? "Vous êtes déja membre? "
                                  : "Vous n'êtes pas membre? ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.018,
                                  fontFamily: primaryPolice),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () => setState(() {
                                  if (register) {
                                    register = false;
                                  } else {
                                    register = true;
                                  }
                                }),
                                child: register
                                    ? Text(
                                        "Se connecter",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Color(0xFF0bfb0b)
                                                .withOpacity(0.7),
                                            fontSize: size.height * 0.018,
                                            fontFamily: primaryPolice),
                                      )
                                    : Text(
                                        "Créer un compte",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Color(0xFF0bfb0b)
                                                .withOpacity(0.7),
                                            fontSize: size.height * 0.018,
                                            fontFamily: primaryPolice),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addCustomer(Customer customer) async {
    await customerService.signupCustomer(customer).then((value1) {
      if (value1 is Customer) {
        customerCredential.customerNumber = value1.customersNumbers!.toString();
        customerCredential.status = value1.status;
      } else {
        groupSnack.buildSnack("Une erreur est survenue", context,
            MediaQuery.of(context).size, true);
      }
    });
  }

  Future<void> addCustomerCredential(
      Customer customer, CustomerCredential customerCredential) async {
    await customersCredentialsService
        .addNewCustomerCredential(customerCredential)
        .then((value) async {
      if (value == 200) {
        var pass = (int.tryParse(customerCredential.customerNumber!)! + 10000000)
            .toString(); //username.replaceAll('-', '')
        pass = StringUtils.addCharAtPosition(pass, "-", 2, repeat: true);
        // Create our message.
        final message = Message()
          ..from = Address('info@az-companies.com', 'Groupe Mobile APP')
          ..recipients.add(customer.emails)
          ..subject = 'Votre compte a été créé avec succès'
          ..html = """Bonjour <b>${customer.names}</b> <br><br>
    <div>
         Votre compte a été créé avec succès.<br>
         Voici votre :<br>
    <ul type="square">
        <li>nom d'utilisateur : <b>${customerCredential.userN}</b></li>
        <li>code d'identification : <b>${pass}</b></li>
        <li>e-mail : <b>${customer.emails}</b></li>
        <li>mot de passe : <b>******************</b></li>
    </ul>
    <br>
    </div>
    <div style="margin-top:10px;">
        Cordialement,<br>
    </div>""";
        await SendMail().sendEmail(message);
        await _login(customerCredential.userN!, customerCredential.passW!);
      } else {
        groupSnack.buildSnack("Une erreur est survenue", context,
            MediaQuery.of(context).size, true);
      }
    });
  }

  Future<void> _login(String username, String password) async {
    CustomersCredentialsService ccs = CustomersCredentialsService();
    if (int.tryParse(username.replaceAll('-', '')) is int &&
        int.tryParse(username.replaceAll('-', ''))! > 10000000) {

      await ccs.getCustomerCredentialByAzID(username.replaceAll('-', ''), true).then((value) {
        if(value is CustomerCredential){
          if(password == value.passW && int.tryParse(username.replaceAll('-', ''))! - 10000000 == int.tryParse(value.customerNumber!)){
            GroupNavigation.destroy(context);
            GroupNavigation.to(context, AcceuilScreen());
          }else{
            groupSnack.buildSnack(
                "Votre profile n'est pas autorisé pour utiliser l'application",
                context,
                MediaQuery.of(context).size,
                true);
          }
        }
        else{
          groupSnack.buildSnack('Une erreur est survenu', context,
              MediaQuery.of(context).size, true);
        }
      });

    }else{
      await ccs.getCustomerCredentialByUsername(username, true).then((value) {
        print(value);
        if (value is CustomerCredential) {
          if (password == value.passW && username == value.userN) {
            GroupNavigation.destroy(context);
            GroupNavigation.to(context, AcceuilScreen());
          } else {
            groupSnack.buildSnack(
                "Votre profile n'est pas autorisé pour utiliser l'application",
                context,
                MediaQuery.of(context).size,
                true);
          }
        } else {
          groupSnack.buildSnack('Une erreur est survenu', context,
              MediaQuery.of(context).size, true);
        }
      });
    }
  }

  Widget logButton(BuildContext context){
    return GroupAsyncButton(
      loadingColor: secondaryColor,
      onPressed: () async{
        if (usernameorcodevalue.isEmpty) {
          groupSnack.buildSnack(
              "Merci de mettre un username valide",
              context,
              MediaQuery.of(context).size,
              true);
        } else {
          if (_passwordKey.currentState!.validate()) {
            passwordvalue = AppConfig.generateMd5(passwordvalue);
            await _login(usernameorcodevalue, passwordvalue);
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width/1.2,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: secondaryColor, width: 2),
            borderRadius: BorderRadius.circular(30),
            color: secondaryColor
        ),
        child: Center(
          child: Text(
            "Se connecter",
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

  Widget regButton(BuildContext context){
    return GroupAsyncButton(
      loadingColor: secondaryColor,
      onPressed: () async{
        //validation for register
        if (_firstnamekey.currentState!.validate()) {
          if (_lastNamekey.currentState!.validate()) {
            if (_usernameKey.currentState!.validate()) {
              if (_emailKey.currentState!.validate()) {
                if (_passwordKey.currentState!.validate()) {
                  if (_confirmPasswordKey.currentState!
                      .validate()) {
                    if (checkedValue == false) {
                      groupSnack.buildSnack(
                          'Acceptez notre politique de confidentialité et nos conditions d\'utilisation',
                          context,
                          MediaQuery.of(context).size,
                          true);
                    } else {
                      //create customer credential
                      print(usernamevalue);
                      print(passwordvalue);
                      customerCredential.userN = usernamevalue;
                      customerCredential.passW = AppConfig.generateMd5(passwordvalue);
                      print("Objet");
                      print(customerCredential.userN);
                      print(customerCredential.passW);

                      //create customer
                      customer.lastName = lastnamevalue;
                      customer.names = firstnamevalue;
                      customer.emails = emailvalue;
                      customer.phones = telephonevalue;

                      await addCustomer(customer).whenComplete(() async{
                        await addCustomerCredential(customer, customerCredential);
                      });
                    }
                  }
                }
              }
            }
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width/1.2,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: secondaryColor, width: 2),
            borderRadius: BorderRadius.circular(30),
            color: secondaryColor
        ),
        child: Center(
          child: Text(
            "Créer un compte",
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
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: isDarkMode
              ? Colors.black
              : const Color(0xffF7F8F8).withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            style: const TextStyle(color: primaryColor),
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
                15.0,
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
}
