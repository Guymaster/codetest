import 'dart:convert';
import 'package:groupe/security/jwt_security.dart';

import 'package:groupe/models/customers_credential.dart';
import 'package:groupe/service/user.dart';

import '../models/general_api_body.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class CustomersCredentialsService {
  String getListCustomerCredentialsUrl =
      AppConfig.appUrl + '/list/customers_credential';
  String addNewCustomerCredentialUrl =
      AppConfig.appUrl + '/add/customers_credential';
  String updateCustomerCredentialUrl =
      AppConfig.appUrl + '/edit/customers_credential';

  Future<dynamic> getCustomerCredentialByUsername(String username, bool saveLocally) async{
    dynamic valueReturned;

    JWTSecure? token = JWTSecure.readToken();

    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var result = await http.get(
      Uri.parse(getListCustomerCredentialsUrl + '?userN=$username'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Authorization' : 'Bearer ${token.token}',
      },
    );

    print(result.statusCode);

    if(result.statusCode == 200){
      Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(result.body) as Map<String, dynamic>;
      GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers_credential');

      Iterable l = json.decode(json.encode(jsonBody.object));
      List<CustomerCredential> customersCredential = List<CustomerCredential>.from(l.map((model)=> CustomerCredential.fromJson(model)));
      //Save User locally
      UserService userService = UserService();
      if(customersCredential.isNotEmpty){
        Future.wait([userService.saveUserLocally(saveLocally, customersCredential[0])]) ;
        valueReturned = customersCredential[0];
      }else{
        valueReturned =   result.statusCode;
      }
    }


    return valueReturned;
  }

  Future<dynamic> getCustomerCredentialByAzID(String azID, bool saveLocally) async{
    dynamic valueReturned;
    int azIdNumber = int.parse(azID);
    azIdNumber = azIdNumber - 10000000;
    dynamic result;
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    result = await http.get(
      Uri.parse(getListCustomerCredentialsUrl + '?customer_number=$azIdNumber'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Authorization' : 'Bearer ${token.token}',
      },
    );

    if(result.statusCode == 200){
      Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(result.body) as Map<String, dynamic>;
      GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers_credential');

      Iterable l = json.decode(json.encode(jsonBody.object));
      List<CustomerCredential> customersCredential = List<CustomerCredential>.from(l.map((model)=> CustomerCredential.fromJson(model)));
      //Save User locally
      UserService userService = UserService();
      if(customersCredential.isNotEmpty){
        Future.wait([userService.saveUserLocally(saveLocally, customersCredential[0])]) ;
        valueReturned = customersCredential[0];
      }else{
        valueReturned =   result.statusCode;
      }
    }


    return valueReturned;
  }

  Future<dynamic> getCustomerCredentialByID(String iD) async{
    dynamic valueReturned;
    dynamic result;
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    result = await http.get(
      Uri.parse(getListCustomerCredentialsUrl + '?customer_number=$iD'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Authorization' : 'Bearer ${token.token}',
      },
    );

    if(result.statusCode == 200){
      Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(result.body) as Map<String, dynamic>;
      GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers_credential');

      Iterable l = json.decode(json.encode(jsonBody.object));
      List<CustomerCredential> customersCredential = List<CustomerCredential>.from(l.map((model)=> CustomerCredential.fromJson(model)));

      if(customersCredential.isNotEmpty){
        valueReturned = customersCredential[0];
      }else{
        valueReturned =   result.statusCode;
      }
    }

    return valueReturned;
  }

  Future<List<CustomerCredential>> getCustomersCredentialsList() async {
    JWTSecure? token = JWTSecure.readToken();

    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }

    var result = await http.get(Uri.parse(getListCustomerCredentialsUrl),
      headers: {
        'Content-Type': 'application/Json',
        'Accept': 'application/json',
        'X-Authorization' : 'Bearer ${token.token}',
      },
    );

    print("here list cc : "+result.statusCode.toString());
    if (result.statusCode == 200) {
      Map<String, dynamic> jsonGeneralApiBodyArray = json.decode(result.body) as Map<String, dynamic>;
      GeneralApiBody jsonBody = GeneralApiBody.fromJson(jsonGeneralApiBodyArray, 'customers_credential');


      Iterable l = json.decode(json.encode(jsonBody.object));
      List<CustomerCredential> customers = List<CustomerCredential>.from(l.map((model)=> CustomerCredential.fromJson(model)));

      print('taille : ${customers.length}');

      return customers;
    }else{
      return [];
    }
  }

  Future<dynamic> addNewCustomerCredential(CustomerCredential cc) async{
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }
    var body = cc.toJson();
    var result = await http.post(Uri.parse(addNewCustomerCredentialUrl),
        headers: {
          'Content-Type': 'application/Json',
          'Accept': 'application/json',
          'X-Authorization' : 'Bearer ${token.token}',
        },
        body: jsonEncode(body)
    );
    print('customer credential ${result.statusCode}');
    return result.statusCode;
  }

  Future<dynamic> updateCustomerCredential(var cc, String? id) async{
    JWTSecure? token = JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }
    //var body = cc.toJson();
    int idNumber = int.parse(id!);
    print(cc);
    var result = await http.post(Uri.parse(updateCustomerCredentialUrl + '?id_credential=$idNumber'),
        headers: {
          'Content-Type': 'application/Json',
          'Accept': 'application/json',
          'X-Authorization' : 'Bearer ${token.token}',
        },
        body: jsonEncode(cc)
    );
    print('customer credential ${result.statusCode}');
    return result.statusCode;
  }

}
