import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:groupe/screens/home_page/acceuil.dart';

void main() {
  runApp(NumberScreen());
}

class NumberScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NumberScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/connexion.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Align(
                            child:
                                Image.asset('images/logowhite.png', width: 230),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Veuillez indiquer votre pays et votre numéro de téléphone',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              height: 2.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),

                        IntlPhoneField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            labelText: 'Votre numéro de téléphone',
                            focusColor: Colors.white,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ' + country.name);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),


                        Padding(
                           padding: EdgeInsets.symmetric(horizontal: 0, vertical: 60),

                            child: ElevatedButton(

                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => AcceuilScreen()),
                                  );
                                  },
                                    child: Text('Suivant',
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    style: ElevatedButton.styleFrom(

                                      fixedSize: const Size(220, 50),
                                      primary: Color(0xFF0bfb0b).withOpacity(0.7),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
