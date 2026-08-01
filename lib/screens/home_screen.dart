import 'package:flutter/material.dart';

import '../widgets/server_card.dart';
import 'server_screen.dart';
import 'hc_files_screen.dart';
import 'help_screen.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final servers = [
      {
        "name":"SSH / SSL / TLS",
        "icon":Icons.security,
      },

      {
        "name":"VLESS",
        "icon":Icons.vpn_key,
      },

      {
        "name":"VMESS",
        "icon":Icons.cloud,
      },

      {
        "name":"TROJAN",
        "icon":Icons.lock,
      },

      {
        "name":"SLOW DNS",
        "icon":Icons.speed,
      },

      {
        "name":"UDP CUSTOM",
        "icon":Icons.network_check,
      },
    ];


    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "CONFIGES ABDELLALI PRO",
        ),
      ),


      drawer: Drawer(

        child: ListView(

          children: [

            const DrawerHeader(
              child: Center(
                child: Text(
                  "CONFIGES\nABDELLALI PRO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:22,
                    fontWeight:FontWeight.bold,
                  ),
                ),
              ),
            ),


            ListTile(
              leading:const Icon(Icons.file_download),
              title:const Text("HTTP CUSTOM FILES"),
              onTap:(){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=>const HcFilesScreen(),
                  ),
                );

              },
            ),


            ListTile(
              leading:const Icon(Icons.help),
              title:const Text("المساعدة"),
              onTap:(){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=>const HelpScreen(),
                  ),
                );

              },
            ),

          ],
        ),
      ),


      body: GridView.builder(

        padding:const EdgeInsets.all(12),

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          crossAxisSpacing:12,
          mainAxisSpacing:12,
        ),


        itemCount:servers.length,


        itemBuilder:(context,index){

          return ServerCard(

            title:servers[index]["name"].toString(),

            icon:servers[index]["icon"] as IconData,


            onTap:(){

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder:(context)=>
                  ServerScreen(
                    type:servers[index]["name"].toString(),
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
