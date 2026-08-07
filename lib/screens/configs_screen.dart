import 'package:flutter/material.dart';
import '../models/config.dart';


class ConfigsScreen extends StatefulWidget {

  const ConfigsScreen({super.key});


  @override
  State<ConfigsScreen> createState() =>
      _ConfigsScreenState();

}



class _ConfigsScreenState
    extends State<ConfigsScreen> {


  List<ConfigModel> configs = [];



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
        const Text(
          "My Configs"
        ),

      ),



      body:


      configs.isEmpty


      ?

      const Center(

        child: Text(

          "No Configs Yet",

          style:
          TextStyle(
            fontSize:20
          ),

        ),

      )



      : ListView.builder(

        itemCount:
        configs.length,


        itemBuilder:
        (context,index){


          final config =
          configs[index];



          return Card(

            margin:
            const EdgeInsets.all(12),


            child:
            ListTile(


              title:
              Text(
                config.name
              ),



              subtitle:
              Text(

                "${config.type}\n🟢 Online",

              ),



              trailing:
              PopupMenuButton(


                itemBuilder:
                (context)=>[


                  const PopupMenuItem(

                    value:"connect",

                    child:
                    Text(
                      "▶ Connect"
                    ),

                  ),


                  const PopupMenuItem(

                    value:"share",

                    child:
                    Text(
                      "📤 Share"
                    ),

                  ),


                  const PopupMenuItem(

                    value:"delete",

                    child:
                    Text(
                      "🗑 Delete"
                    ),

                  ),


                ],


                onSelected:
                (value){


                  if(value=="delete"){


                    setState((){


                      configs.removeAt(index);


                    });


                  }


                },


              ),



            ),


          );


        },


      ),



    );


  }


}
