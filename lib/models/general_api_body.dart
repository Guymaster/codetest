





class GeneralApiBody{
  bool apiStatus;
  dynamic object;

  GeneralApiBody({required this.apiStatus, required this.object});

  factory GeneralApiBody.fromJson(dynamic json, String objectName){
    return GeneralApiBody(
        apiStatus : json['success'],
        object : json[objectName]
    );
  }
}