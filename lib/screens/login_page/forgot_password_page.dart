import 'dart:math';

import 'package:groupe/classes/navigation.dart';
import 'package:groupe/components/edit_texts/card_formatter.dart';
import 'package:groupe/components/edit_texts/default_edit_text.dart';
import 'package:groupe/components/email/send_mail.dart';
import 'package:groupe/components/toasts/default_toast.dart';
import 'package:groupe/models/customer.dart';
import 'package:groupe/models/customers_credential.dart';
import 'package:groupe/screens/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:groupe/service/customer.dart';
import 'package:groupe/service/customers_credential.dart';
import 'package:groupe/utils/constants.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../../utils/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String motdepasse = '';
  String emailvalue = "";

  GroupSnack groupSnack = GroupSnack();

  final _emailKey = GlobalKey<FormState>();

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

                        padding: EdgeInsets.all(21.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () =>
                                  Navigator.pop(context), //go back to authPage
                              child: Icon(
                                Icons.arrow_back,
                                color: isDarkMode ? Colors.white : Colors.white,
                                size: size.height * 0.03,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.015,

                              ),

                              child: Text(

                                'Retour',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.020,
                                    fontFamily: primaryPolice
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(21.0),

                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Réinitialiser le mot de passe',
                            style: TextStyle(
                              color:  Colors.white,
                              fontSize: size.height * 0.028,
                              fontWeight: FontWeight.bold,
                                fontFamily: primaryPolice
                            ),
                          ),
                        ),
                      ),
                      Padding(

                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                        child: Align(
                          child: Text(
                            "Mot de passe oublié? Pas de panique, ça arrive à tout le monde!\n",

                            style: TextStyle(
                              color:
                            isDarkMode ? Colors.white : Colors.white,
                              fontSize: size.height * 0.02,
                                height: 1.7,
                                fontFamily: primaryPolice
                            ),
                          ),
                        ),
                      ),
                      DefaultEditText(
                        textInputFormatter: [
                          CardFormatter(sample: 'xx-xx-xx-xx', separator: '-')
                        ] ,
                        hintText: 'Code d\'identification',
                        onChanged: (v){
                          emailvalue = v;
                          if(int.tryParse(v.replaceAll('-', '')) is int){
                            setState(() {
                            });}
                        },
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: primaryColor,
                          size: 22,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.16),
                        child: ButtonWidget(
                            text: 'Envoyer',
                            backColor: isDarkMode
                                ? [
                                    Colors.black,
                                    Colors.black,
                                  ]
                                : const [Color(0xff92A3FD), Color(0xff9DCEFF)],
                            textColor: const [
                              Colors.white,
                              Colors.white,
                            ],
                            onPressed: () async {
                              if (emailvalue.length == 11 ) {
                                await resetPassword(emailvalue);
                              }else{
                                groupSnack.buildSnack(
                                  'Merci d\'entrée un code d\'identification valide',
                                  context,
                                  size,
                                  true
                                );
                              }
                            }),
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

  Future<void> resetPassword(String username) async{
    CustomersCredentialsService ccs = CustomersCredentialsService();
    if(int.tryParse(username.replaceAll('-', '')) is int && int.tryParse(username.replaceAll('-', ''))! > 10000000){
      await ccs.getCustomerCredentialByAzID(emailvalue.replaceAll('-', ''), true).then((ccValue) async {
        print(emailvalue.replaceAll('-', ''));
        if(ccValue is CustomerCredential){
          if(int.tryParse(username.replaceAll('-', ''))! - 10000000 == int.tryParse(ccValue.customerNumber!)){
            CustomerService customerService = CustomerService();
            Customer customer = await customerService.getCustomer(ccValue.customerNumber!);
            motdepasse = generateRandomString(10);
            var cCredential = {
              'customer_number' : ccValue.customerNumber,
              'userN' : ccValue.userN,
              'passW' : AppConfig.generateMd5(motdepasse),
            };
            await ccs.updateCustomerCredential(cCredential, ccValue.idCredential).
            then((value) async {
              if(value == 200){

                // Create our message.
                final message = Message()
                  ..from = Address('info@az-companies.com', 'Groupe Mobile APP')
                  ..recipients.add(customer.emails)
                  ..subject = 'Nouveau mot de passe généré'
                  ..html = """Bonjour <b>${customer.names}</b> <br><br>
    <div>
        Votre mot de passe a été réinitialisé avec succès.<br>
        Vous pouvez vous connecter avec votre nom d'utilisateur: <b>${ccValue.userN}</b>
        ou votre code d'identification : <b>${emailvalue}</b>
        et votre nouveau mot de passe : <b>${motdepasse}</b>.<br>
        Vous pouvez le changer plus tard dans votre compte.
    </div>
    <div style="margin-top:10px;">
        Cordialement,<br>
    </div>""";
                await SendMail().sendEmail(message);
                GroupNavigation.destroy(context);
                groupSnack.buildSnack(
                  'Veuillez vérifier votre boite E-mail',
                  context,
                  MediaQuery.of(context).size,
                  false
                );
              }else{
                groupSnack.buildSnack(
                  "Une erreur est survenue",
                  context,
                  MediaQuery.of(context).size,
                  true
                );
              }
            });
          }else{
            groupSnack.buildSnack(
              'Votre profile n\'existe pas',
              context,
              MediaQuery.of(context).size,
              true
            );
          }

        }
        else{
          groupSnack.buildSnack(
            "Une erreur est survenu",
            context,
            MediaQuery.of(context).size,
            true
          );

        }
      });

    }
  }

  String generateRandomString(int len) {
    var r = Random();
    String randomString =String.fromCharCodes(List.generate(len, (index)=> r.nextInt(33) + 89));
    return randomString;
  }


}
