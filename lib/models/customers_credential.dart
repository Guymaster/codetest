



class CustomerCredential{
  String? idCredential;
  String? customerNumber;
  String? userN;
  String? passW;
  String? status;

  CustomerCredential.empty();
  CustomerCredential(
      {required this.idCredential,
        required this.customerNumber,
        required this.userN,
        required this.passW,
        required this.status});



  factory CustomerCredential.fromJson(dynamic json){
    return CustomerCredential(
      idCredential : json['id_credential'],
      customerNumber : json['customer_number'],
      userN : json['userN'],
      passW : json['passW'],
      status : json['status'],
    );
  }
  Map<dynamic, dynamic> toJson(){
    return{
      "id_credential" : idCredential,
      "customer_number" : customerNumber,
      "userN" : userN,
      "passW" : passW,
      "status" : status,
    };
  }
}