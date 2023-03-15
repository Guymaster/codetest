import 'package:flutter/material.dart';
import 'package:groupe/screens/detail_page/page_two.dart';
import 'package:groupe/classes/navigation.dart';

import '../../utils/colors.dart';



class FiveScreen extends StatefulWidget {
  const FiveScreen({Key? key}) : super(key: key);

  @override
  State<FiveScreen> createState() => _FiveScreenState();
}



class _FiveScreenState extends State<FiveScreen> {
  bool? isChecked = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    super.initState();
  }

  Widget _buildTextField({
    required bool obscureText,
    Widget? prefixedIcon,
    Widget? suffixIcon,
    String? hintText,
  }) {
    return Material(
      color: Colors.transparent,
      elevation: 2,

        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),

      child: TextField(
        cursorColor: primaryColor,
        cursorWidth: 2,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          fillColor:  Colors.white.withOpacity(0.7),
          prefixIcon: prefixedIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: primaryPolice,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontFamily: primaryPolice,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        onPressed: () {

        },
      ),
    );
  }

  Widget _buildRemeberMe() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
          },
          checkColor: primaryColor,
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            fontFamily: secondaryPolice,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Color(0xFF0bfb0b).withOpacity(0.7),
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        child: const Text(
          'Valider',
          style: TextStyle(
            fontFamily: primaryPolice,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildLogoButton({
    required String image,
    required VoidCallback onPressed,
  }) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: SizedBox(
        height: 30,
        child: Image.asset(image),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLogoButton(
          image: 'images/facebook_logo.png',
          onPressed: () {},
        ),

        _buildLogoButton(
          image: 'images/google_logo.png',
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an Account? ',
          style: TextStyle(
            fontFamily: primaryPolice,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        InkWell(
          child: const Text(
            'Sing Up',
            style: TextStyle(
              fontFamily: secondaryPolice,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/connexion.png'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ).copyWith(top: 60),
              child: Column(



                children: [

                   Image.asset('images/logowhite.png', width:200),


                  const Text(
                    'Sign in',
                    style: TextStyle(
                      fontFamily: secondaryPolice,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Username',
                      style: TextStyle(
                        fontFamily: secondaryPolice,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField(
                    hintText: 'Enter your username',
                    obscureText: false,
                    prefixedIcon: const Icon(Icons.person, color: primaryColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: secondaryPolice,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),


                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField(
                    hintText: 'Enter your password',
                    obscureText: true,
                    prefixedIcon: const Icon(Icons.lock, color: primaryColor),
                    suffixIcon:  IconButton(
                      icon: Icon(isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible =
                          !isConfirmPasswordVisible;
                        });
                      },
                    ),

                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildForgotPasswordButton(),
                  _buildRemeberMe(),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildLoginButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '- OR -',
                    style: TextStyle(
                      fontFamily: secondaryPolice,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Sign in with',
                    style: TextStyle(
                      fontFamily: secondaryPolice,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildSocialButtons(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildSignUpQuestion()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}













