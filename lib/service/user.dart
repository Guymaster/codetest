


import 'dart:io';


import 'package:groupe/models/customer.dart';
import 'package:groupe/models/customers_credential.dart';
import 'package:groupe/service/customer.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import '../classes/application_user.dart';
import '../classes/app_user.dart';
import '../security/jwt_security.dart';
import '../utils/constants.dart';
import 'connection.dart';

class UserService{
  static String loginUrl = AppConfig.appUrl+"/login";


  late final AppUser appUser;
  static late JWTSecure jwtSecurity;
  UserService();

  static Future<dynamic> applicationBridge() async {
    final data = jsonEncode({
      "username": 'ApiUser',
      "password": 'ApiUser2022!'
    });
    var res = await http.post(
        Uri.parse(loginUrl),
        body: data,
        headers: {
          'Content-Type': 'application/json',
            'Accept': 'application/json',
        }
    );
    jwtSecurity = JWTSecure(token: JWTSecure.getTokenFromMap(res.body)!);
    await jwtSecurity.storeToken().then((value) => print("Token Stored"));
    return  JWTSecure.getTokenFromMap(res.body)!;
  }

  Future<dynamic> saveUserLocally(bool isSaveConnect, CustomerCredential customerCredential) async{

    CustomerService customerService = CustomerService();
    Customer customer = await customerService.getCustomer(customerCredential.customerNumber!);

    AppUser user = AppUser(id: customer.customersNumbers, fName: customer.names, lName: customer.lastName, email: customer.emails );
    ApplicationUser applicationUser = ApplicationUser(user.id,isSaveConnect, user.fName, user.lName, user.email);
    await applicationUser.saveUser();
    return user;
  }
}