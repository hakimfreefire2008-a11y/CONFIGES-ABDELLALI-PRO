import 'package:flutter/material.dart';

import 'create_config_screen.dart';
import 'configs_screen.dart';
import 'server_screen.dart';
import 'hc_files_screen.dart';
import 'help_screen.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "CONFIGES ABDELLALI PRO"
        ),

        centerTitle: true,

      ),



      body: Padding(

        padding:
        const EdgeInsets.all(16),


        child: ListView(


          children: [


            _card(

              context,

              "➕ Create Config",

              const CreateConfigScreen(),

            ),



            _card(

              context,

              "📁 My Configs",

              const ConfigsScreen(),

            ),



            _card(

              context,

              "🌐 Servers",

              const ServerScreen(),

            ),



            _card(

              context,

              "📂 HC Files",

              const HcFilesScreen(),

            ),



            _card(

              context,

              "❓ Help",

              const HelpScreen(),

            ),



          ],


        ),


      ),


    );


  }




  Widget _card(

      BuildContext context,

      String title,

      Widget page

      ){



    return Container(


      margin:
      const EdgeInsets.only(
        bottom:15
      ),



      child: ElevatedButton(


        style:
        ElevatedButton.styleFrom(


          padding:
          const EdgeInsets.all(22),


        ),



        onPressed:(){


          Navigator.push(

            context,

            MaterialPageRoute(

              builder:(context)=>page,

            ),

          );


        },



        child:Text(

          title,

          style:
          const TextStyle(

            fontSize:18,

          ),

        ),



      ),


    );


  }



}
