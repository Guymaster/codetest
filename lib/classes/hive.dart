import 'package:groupe/security/jwt_security.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'application_user.dart';

class HiveHelper {
  static Future<void> init() async {
    var storage = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(storage.path);
    Hive.registerAdapter(ApplicationUserAdapter());
    Hive.registerAdapter(JWTSecureAdapter());
  }
}
