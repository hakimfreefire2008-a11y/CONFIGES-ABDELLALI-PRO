import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {

  static const String url =
  "https://raw.githubusercontent.com/hakimfreefire2008-a11y/CONFIGES-ABDELLALI-PRO/master/servers.json";


  static Future<Map<String, dynamic>> getServers() async {

    final response = await http.get(
      Uri.parse(url),
    );


    if (response.statusCode == 200) {

      return jsonDecode(response.body);

    } else {

      throw Exception(
        "Failed loading servers"
      );

    }

  }

}
