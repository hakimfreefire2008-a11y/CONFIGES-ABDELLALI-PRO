import 'package:flutter/material.dart';


class ServerScreen extends StatelessWidget {

  final String type;


  const ServerScreen({

    super.key,

    required this.type,

  });


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: Text(type),

      ),


      body: ListView(

        padding: const EdgeInsets.all(15),


        children: [


          Card(

            child: ListTile(

              leading: const Icon(
                Icons.flag,
              ),


              title: const Text(
                "Morocco Server",
              ),


              subtitle: const Text(
                """
Host: example.com
Port: 443
Ping: 30ms
Speed: 1Gbps
Expire: 2026-12-31
""",
              ),


              trailing: IconButton(

                icon: const Icon(
                  Icons.copy,
                ),

                onPressed: () {},

              ),

            ),

          ),



          Card(

            child: ListTile(

              leading: const Icon(
                Icons.flag,
              ),


              title: const Text(
                "France Server",
              ),


              subtitle: const Text(
                """
Host: fr.example.com
Port: 443
Ping: 45ms
Speed: 10Gbps
Expire: 2026-12-31
""",
              ),

              trailing: IconButton(

                icon: const Icon(
                  Icons.copy,
                ),

                onPressed: () {},

              ),

            ),

          ),


        ],

      ),

    );

  }

}
