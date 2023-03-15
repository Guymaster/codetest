import 'dart:convert';

import 'package:groupe/classes/boxes.dart';
import 'package:hive/hive.dart';

part 'jwt_security.g.dart';

@HiveType(typeId: 13)
class JWTSecure extends HiveObject{
  @HiveField(0)
  String token;

  JWTSecure({
    required this.token,
  });

  setToken(String token){
    this.token = token;
  }

  String getToken(){
    return token;
  }

  Future<void> storeToken() async{
    await Boxes.getJwtBox().put("jwwt", JWTSecure(token: token));
  }

  static JWTSecure readToken()  {
    //get All the Object from hive
    if(Boxes.getJwtBox().isEmpty) {
      print('Empty');
      Boxes.getJwtBox().put("jwwt", JWTSecure(token: ''));
      return JWTSecure(token: '');
    }
    return Boxes.getJwtBox().get("jwwt");
  }

  static String? getTokenFromMap(String jwt){
    Map<String, dynamic> jwtJson = json.decode(jwt);
    return jwtJson["JWT"];
  }

}