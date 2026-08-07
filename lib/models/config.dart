class ConfigModel {

  String id;
  String name;
  String type;

  String host;
  String port;

  String username;
  String password;

  String sni;

  bool payloadEnabled;
  String payload;

  bool proxyEnabled;
  String proxy;

  DateTime createdAt;


  ConfigModel({

    required this.id,
    required this.name,
    required this.type,

    this.host = "",
    this.port = "",

    this.username = "",
    this.password = "",

    this.sni = "",

    this.payloadEnabled = false,
    this.payload = "",

    this.proxyEnabled = false,
    this.proxy = "",

    required this.createdAt,

  });


  Map<String,dynamic> toJson(){

    return {

      "id":id,
      "name":name,
      "type":type,

      "host":host,
      "port":port,

      "username":username,
      "password":password,

      "sni":sni,

      "payloadEnabled":payloadEnabled,
      "payload":payload,

      "proxyEnabled":proxyEnabled,
      "proxy":proxy,

      "createdAt":createdAt.toIso8601String(),

    };

  }


}
