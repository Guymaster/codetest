



import 'package:hive/hive.dart';


part 'app_user.g.dart';
@HiveType(typeId: 29)
class AppUser extends HiveObject  {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? fName;
  @HiveField(2)
  String? lName;
  @HiveField(3)
  String? email;


  AppUser({this.id, this.fName, this.lName, this.email});

  AppUser.empty();
}


