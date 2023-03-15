import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:groupe/classes/app_user.dart';
import 'package:groupe/models/customer.dart';
import 'package:groupe/models/picture.dart';
import 'package:groupe/security/jwt_security.dart';
import 'package:groupe/service/user.dart';
import 'package:groupe/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/general_api_body.dart';
class CustomerService{

  String customerSignupUrl = AppConfig.appUrl + '/add/customers';
  String getListCustomerUrl = AppConfig.appUrl + '/list/customers';
  String getEditCustomerUrl = AppConfig.appUrl + '/edit/customers';

//liaison seller_number
  // o get : amount_in_wallet

  // https://smart.smart-managers.online/api/list/customers_credential?username=contact@degstoreshop.com


  Future<dynamic> signupCustomer(Customer c) async {
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var body = c.toJson();
    var result = await http.post(Uri.parse(customerSignupUrl),
        headers: {
          'Content-Type': 'application/Json',
          'Accept': 'application/json',
          'X-Authorization' : 'Bearer ${token.token}',
        },
        body: jsonEncode(body)
    );

    //print(result.body);
    Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(result.body) as Map<String, dynamic>;
    GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers');
    Customer customer = Customer.fromJsonList(json.decode(json.encode(jsonBody.object)));
    print('hello :  ${customer.customersNumbers}');


    return customer;
  }

  Future<List<Customer>> getCustomersList() async {
    JWTSecure? token =  JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var result = await http.get(Uri.parse(getListCustomerUrl),
      headers: {
        'Content-Type': 'application/Json',
        'Accept': 'application/json',
        'X-Authorization' : 'Bearer ${token.token}',
      },
    );

    if (result.statusCode == 200) {
      Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(result.body) as Map<String, dynamic>;
      GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers');


      Iterable l = json.decode(json.encode(jsonBody.object));
      List<Customer> customers = List<Customer>.from(l.map((model)=> Customer.fromJsonList(model)));
      for (var element in customers) {
        print(element.emails! +'\n');
      }

      return customers;
    }else{
      return [];
    }
  }

  Future<dynamic> getCustomer(String customerNumber) async {
    dynamic customer;
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var  result  = await http.get(Uri.parse(getListCustomerUrl + '?Customers_Numbers=$customerNumber'),
      headers: {
        'Content-Type': 'application/Json',
        'Accept': 'application/json',
        'X-Authorization' : 'Bearer ${token.token}',
      },
    );


    if (result.statusCode == 200) {
      Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(result.body) as Map<String, dynamic>;
      GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers');
      Iterable l = json.decode(json.encode(jsonBody.object));
      List<Customer> allCustomers = List<Customer>.from(l.map((model)=> Customer.fromJson(model)));
      customer =  allCustomers[0];
    }
    return customer;

  }

  Future<dynamic> editCustomer(Customer customer) async {
    dynamic returnedCustomer = '';
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var body = customer.toJson();
    var result = await http.post(Uri.parse(getEditCustomerUrl + '/${customer.customersNumbers}'),
        headers: {
          'Content-Type': 'application/Json',
          'Accept': 'application/json',
          'X-Authorization' : 'Bearer ${token.token}',
        },
        body: jsonEncode(body)
    );
    print(result.body);
    if(result.statusCode == 200){
      returnedCustomer = Customer.fromJsonList(json.decode(result.body));
    }

    return returnedCustomer;
  }

  Future<dynamic> getPicture(String? url) async {
    dynamic returnedPicture = '';
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var result = await http.get(Uri.parse(url!),
        headers: {
          'Content-Type': 'application/Json',
          'Accept': 'application/json',
          'X-Authorization' : 'Bearer ${token.token}',
        },
    );
    if(result.statusCode == 200){
      returnedPicture = result.bodyBytes;
    }
    return returnedPicture;

  }

  Future<dynamic> changePhoto(Customer? customer,String filename) async {
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var request = http.MultipartRequest('POST', Uri.parse(getEditCustomerUrl + '/${customer!.customersNumbers}'));
    request.files.add(
        http.MultipartFile(
            'Picture',
            File(filename).readAsBytes().asStream(),
            File(filename).lengthSync(),
            filename: filename.split("/").last
        )
    );
    request.headers.addAll({
      'Content-Type': 'application/Json',
      'Accept': 'application/json',
      'X-Authorization' : 'Bearer ${token.token}',
    });
    var res = await request.send();
    res.stream.transform(utf8.decoder).listen((value) {
      print(json.decode(value));
      Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(value) as Map<String, dynamic>;
      GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers');
      customer = Customer.fromPictureJson(json.decode(json.encode(jsonBody.object)));
    });
    return customer!.picture;
  }
}