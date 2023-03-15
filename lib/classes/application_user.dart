




import 'package:hive/hive.dart';

import 'boxes.dart';
part 'application_user.g.dart';

@HiveType(typeId: 2)
class ApplicationUser extends HiveObject{

  //All variables used for ApplicationUser with field index annotation
  @HiveField(0)
  String? id;
  @HiveField(1)
  bool saveConnect;
  @HiveField(2)
  String? fName;
  @HiveField(3)
  String? lName;
  @HiveField(4)
  String? email;


  ApplicationUser(this.id, this.saveConnect, this.fName, this.lName,
      this.email);

  //Declare two type of constructors, one used for put object informations and the other ".empty" for get all informations by calling getUser



  //Store all the object of User connected in one hive node
  Future<void> saveUser() async {
    await Boxes.getUserInfo().put("user", this);
  }

  //Get User currently connected in the app
  static Future<ApplicationUser> getConnectingUser() async{
    return await Boxes.getUserInfo().get("user");
  }
  //Get User currently connected in the app
  static Future<List<String>> getUserRoles() async{
    return await Boxes.getUserInfo().get("user").roles;
  }


  static updateSavingModeUser(bool saveMode) async {
    ApplicationUser currentUser = await ApplicationUser.getConnectingUser();
    currentUser.saveConnect = saveMode;
    await currentUser.saveUser();
  }
}