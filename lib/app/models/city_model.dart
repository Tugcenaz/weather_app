import 'dart:convert';
CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));
String cityModelToJson(CityModel data) => json.encode(data.toJson());
class CityModel {
  CityModel({
      int? id, 
      String? name, 
      String? region, 
      String? country, 
      double? lat, 
      double? lon, 
      String? url,}){
    _id = id;
    _name = name;
    _region = region;
    _country = country;
    _lat = lat;
    _lon = lon;
    _url = url;
}

  CityModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _url = json['url'];
  }
  int? _id;
  String? _name;
  String? _region;
  String? _country;
  double? _lat;
  double? _lon;
  String? _url;

  int? get id => _id;
  String? get name => _name;
  String? get region => _region;
  String? get country => _country;
  double? get lat => _lat;
  double? get lon => _lon;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['region'] = _region;
    map['country'] = _country;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['url'] = _url;
    return map;
  }

}