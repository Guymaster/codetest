


class Picture{
  String? type;
  String? url;
  String? name;

  Picture({this.type, this.url, this.name});

  factory Picture.fromJson(dynamic json){
    return Picture(
        type: json['type'],
        url : json['url'],
        name : json['name']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "type": type,
      "url": url,
      "name": name
    };
  }
}