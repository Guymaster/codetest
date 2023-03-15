



import 'dart:convert';
import 'dart:io';
import 'package:groupe/utils/colors.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AppConfig {
  static String appUrl = "https://smart.smart-managers.online/api";

  static String appName = "Groupe";
  static String appVersion = "1.1.1";
  static Duration timeOut = const Duration(seconds: 6);
  static String jwt = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2NjYwMDkyMzYsImp0aSI6IkdCSW1FSWZOdzBrUDNRMW5NTjRBS3ZzaENEN0VlU2RZa1RBTXJlc2lRMEE9IiwiaXNzIjoic21hcnQuc21hcnQtbWFuYWdlcnMub25saW5lIiwibmJmIjoxNjY2MDA5MjQxLCJleHAiOjE2NjYwMDk4NDEsInNlY3VyaXR5Ijp7InVzZXJuYW1lIjoiQXBpVXNlciIsInVzZXJpZCI6bnVsbCwicGFyZW50dXNlcmlkIjoiIiwidXNlcmxldmVsaWQiOiItMSIsInBlcm1pc3Npb24iOmZhbHNlfX0.pcX8Od2wXth2_JAxm2NbkzW1NxezPpSD9BcL1Q8oJ7oN4TwoBxQEjoW8atfytZkMGocTQT2pjOKQAbuLSJ1MEA';



  static generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);

    return hex.encode(digest.bytes);
  }

  static getPageWidth(BuildContext context){
    return  MediaQuery.of(context).size.width;
  }
  static getPageHeight(BuildContext context){
    return  MediaQuery.of(context).size.height;
  }
}
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
void onLoading(BuildContext context, String title) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CircularProgressIndicator(color: secondaryColor,), const SizedBox(width: 20,),
              Text(title),
            ],
          ),
        ),
      );
    },
  );

}


