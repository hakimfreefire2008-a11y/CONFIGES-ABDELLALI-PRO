import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/config.dart';

class StorageService {

  static Future<void> saveConfigs(
      List<ConfigModel> configs) async {

    final prefs =
        await SharedPreferences.getInstance();

    final data =
        configs.map((e) => e.toJson()).toList();

    await prefs.setString(
      "configs",
      jsonEncode(data),
    );
  }


  static Future<List<ConfigModel>> loadConfigs() async {

    final prefs =
        await SharedPreferences.getInstance();

    final data =
        prefs.getString("configs");


    if (data == null) {
      return [];
    }


    final List list =
        jsonDecode(data);


    return list.map((e) {

      return ConfigModel(

        id: e["id"],

        name: e["name"],

        type: e["type"],

        host: e["host"],

        port: e["port"],

        username: e["username"],

        password: e["password"],

        sni: e["sni"],

        payloadEnabled:
        e["payloadEnabled"],

        payload:
        e["payload"],

        proxyEnabled:
        e["proxyEnabled"],

        proxy:
        e["proxy"],

        createdAt:
        DateTime.parse(
          e["createdAt"],
        ),

      );

    }).toList();

  }

}
