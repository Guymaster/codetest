import 'dart:convert';
import 'package:http/http.dart' as http;


class Connection{
  String? addressIp;
  String? localisation;
  String? city;
  String? country;
  String? region;
  String? timeZone;


  Connection(this.addressIp, this.localisation, this.city, this.country,
      this.region, this.timeZone);
  Connection.empty();


  Map<String, dynamic> toJson(){
    return {
      "addressIp" : addressIp,
      "localisation" : localisation,
      "city" : city,
      "country" : country,
      "region" : region,
      "timeZone" : timeZone,
    };
  }
}