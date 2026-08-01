import 'package:flutter/material.dart';
import '../services/api_service.dart';


class ServerScreen extends StatefulWidget {

  final String type;

  const ServerScreen({
    super.key,
    required this.type,
  });


  @override
  State<ServerScreen> createState() =>
      _ServerScreenState();

}



class _ServerScreenState extends State<ServerScreen> {


  late Future<Map<String,dynamic>> servers;


  @override
  void initState() {

    super.initState();

    servers = ApiService.getServers();

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: Text(widget.type),

      ),



      body: FutureBuilder<Map<String,dynamic>>(

        future: servers,


        builder:(context,snapshot){


          if(snapshot.connectionState ==
              ConnectionState.waiting){

            return const Center(
              child:CircularProgressIndicator(),
            );

          }



          if(snapshot.hasError){

            return Center(

              child:Text(
                "خطأ في تحميل السيرفرات",
              ),

            );

          }



          final key =
          widget.type
              .toLowerCase()
              .replaceAll(" ", "");


          final data =
          snapshot.data![key] ?? [];



          return ListView.builder(

            padding:
            const EdgeInsets.all(12),


            itemCount:data.length,


            itemBuilder:(context,index){


              final server =
              data[index];


              return Card(

                child:ListTile(


                  leading:
                  const Icon(
                    Icons.flag,
                  ),


                  title:
                  Text(
                    server["country"] ?? "",
                  ),



                  subtitle:Text(

                    """
Host: ${server["host"]}
Port: ${server["port"]}
Ping: ${server["ping"]}
Speed: ${server["speed"]}
Expire: ${server["expire"]}
""",

                  ),


                  trailing:
                  IconButton(

                    icon:
                    const Icon(
                      Icons.copy,
                    ),

                    onPressed:(){},

                  ),

                ),

              );


            },

          );


        },


      ),

    );

  }

}
