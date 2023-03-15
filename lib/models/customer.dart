



import 'dart:convert';

import 'package:groupe/models/general_api_body.dart';
import 'package:groupe/models/picture.dart';

class Customer{
  String? customersNumbers;
  String? createdDate;
  String? updatedDate;
  String? type;
  String? size;
  String? lastName;
  String? names;
  String? birthDate;
  String? sexe;
  String? matrimonial;
  String? nbChild;
  Picture? picture;
  String? status;
  String? user;
  String? categories;
  String? idDoc;
  String? phones;
  String? country;
  String? province;
  String? city;
  String? emails;
  String? website;
  String? adresses;
  String? appt;
  String? postalCode;
  String? linkedCompany;
  String? notes;
  String? codeLanguage;
  String? preferedCurrency;
  String? addFrom;

  Customer.empty();


  Customer({ this.customersNumbers,
    this.createdDate,
    this.updatedDate,
    this.type,
    this.size,
    this.lastName,
    this.names,
    this.birthDate,
    this.sexe,
    this.matrimonial,
    this.nbChild,
    this.picture,
    this.status,
    this.user,
    this.categories,
    this.idDoc,
    this.phones,
    this.country,
    this.province,
    this.city,
    this.emails,
    this.website,
    this.adresses,
    this.appt,
    this.postalCode,
    this.linkedCompany,
    this.notes,
    this.codeLanguage,
    this.preferedCurrency,
    this.addFrom});

  Customer.getList(
      {this.customersNumbers,
        this.createdDate,
        this.updatedDate,
        this.type,
        this.size,
        this.lastName,
        this.names,
        this.status,
        this.categories,
        this.phones,
        this.emails});


  Customer.signUp({
    required this.names,
    required this.lastName,
    required this.createdDate,
    required this.phones,
    required this.emails,
    required this.type,
    required this.status,
    required this.categories
  });

  factory Customer.fromJsonList(dynamic customerJSon){

    return Customer.getList(
      customersNumbers : customerJSon['Customers_Numbers'],
      createdDate : customerJSon['created_date'],
      updatedDate : customerJSon['updated_date'],
      type : customerJSon['type'],
      size : customerJSon['size'],
      lastName : customerJSon['LastName'],
      names : customerJSon['Names'],
      status : customerJSon['Status'],
      categories : customerJSon['Categories'],
      phones : customerJSon['Phones'],
      emails : customerJSon['E-mails'],

    );
  }
  factory Customer.fromJson(dynamic customerJSon){
    return Customer(
        customersNumbers : customerJSon['Customers_Numbers'],
        createdDate : customerJSon['created_date'],
        updatedDate : customerJSon['updated_date'],
        type : customerJSon['type'],
        size : customerJSon['size'],
        lastName : customerJSon['LastName'],
        names : customerJSon['Names'],
        birthDate : customerJSon['birth_date'],
        sexe : customerJSon['sexe'],
        matrimonial : customerJSon['matrimonial'],
        nbChild : customerJSon['nb_child'],
        picture: customerJSon['Picture'] == null ? null :  Picture.fromJson(customerJSon['Picture']),
        status : customerJSon['Status'],
        user : customerJSon['E-mails'],
        categories  : customerJSon['Categories'],
        idDoc : customerJSon['id_doc'],
        phones  : customerJSon['Phones'],
        country : customerJSon['Country'],
        province : customerJSon['Province'],
        city : customerJSon['City'],
        emails : customerJSon['E-mails'],
        website : customerJSon['Website'],
        adresses : customerJSon['Adresses'],
        appt : customerJSon['Appt'],
        postalCode : customerJSon['Postal_Code'],
        linkedCompany : customerJSon['linked_company'],
        notes : customerJSon['Notes'],
        codeLanguage : customerJSon['code_language'],
        preferedCurrency : customerJSon['prefered_currency'],
        addFrom : customerJSon['added_from']
    );
  }
  factory Customer.fromPictureJson(dynamic json){
    return Customer(
      picture: Picture.fromJson(json['Picture']),
    );
  }


  Map<dynamic, dynamic> toJson(){
    return{
      "Customers_Numbers": customersNumbers,
      "created_date": createdDate,
      "updated_date": updatedDate,
      "type": type,
      "size": size,
      "LastName": lastName,
      "Names": names,
      "birth_date": birthDate,
      "sexe": sexe,
      "matrimonial": matrimonial,
      "nb_child": nbChild,
      "Picture": picture,
      "Status": status,
      "User": user,
      "Categories": categories,
      "id_doc": idDoc,
      "Phones": phones,
      "Country": country,
      "Province": province,
      "City": city,
      "E-mails": emails,
      "Website": website,
      "Adresses": adresses,
      "Appt": appt,
      "Postal_Code": postalCode,
      "linked_company": linkedCompany,
      "Notes": notes,
      "code_language": codeLanguage,
      "prefered_currency": preferedCurrency,
      "added_from": addFrom
    };
  }
}