

import 'dart:convert';

import 'package:groupe/security/jwt_security.dart';
import 'package:groupe/service/user.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../classes/connection.dart';
import '../utils/constants.dart';

class ConnectionService{

  String connectionUrl = 'http://ip-api.com/json';
  String saveConnectionUrl = AppConfig.appUrl + '/connections';


  Future<Connection> getConnection() async {
    Connection connection = Connection.empty();
    await http.get(Uri.parse(connectionUrl)).then((value) {
      connection.addressIp = json.decode(value.body)['query'].toString();
      connection.localisation = json.decode(value.body)['lat'].toString() + ',' + json.decode(value.body)['lon'].toString();
      connection.city = json.decode(value.body)['city'].toString();
      connection.country = json.decode(value.body)['country'].toString();
      connection.region = json.decode(value.body)['region'].toString();
      connection.timeZone = json.decode(value.body)['timezone'].toString();
    });

    return connection;

  }


  Future<int> saveConnection() async {
    Connection connection = await getConnection();
    var token =  JWTSecure.readToken();
    bool hasExpired = JwtDecoder.isExpired(token.token);

    if(hasExpired == true){
      await UserService.applicationBridge();
      token = JWTSecure.readToken();
    }
    var res = await http.post(
        Uri.parse(saveConnectionUrl),
        body: jsonEncode(connection.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization' : 'Bearer $token'
        }
    );
    return res.statusCode;

  }
}