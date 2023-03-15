

import 'package:groupe/security/jwt_security.dart';
import 'package:hive/hive.dart';

import 'application_user.dart';



class Boxes{

  static Box getUserInfo() => Hive.box<ApplicationUser>('userInformations');
  static Box getJwtBox() => Hive.box<JWTSecure>('javaTokenSecurity');

}