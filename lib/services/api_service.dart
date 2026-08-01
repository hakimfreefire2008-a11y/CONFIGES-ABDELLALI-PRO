import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {


  static const String url =
      "ضع_رابط_servers.json_هنا";


  static Future<Map<String,dynamic>> getServers() async {


    final response =
    await http.get(
      Uri.parse(url),
    );


    if(response.statusCode == 200){

      return jsonDecode(response.body);

    }else{

      throw Exception(
        "Failed loading servers"
      );

    }

  }

}
