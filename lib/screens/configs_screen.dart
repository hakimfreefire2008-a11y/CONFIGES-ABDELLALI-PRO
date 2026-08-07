import 'package:flutter/material.dart';
import '../models/config.dart';
import '../services/storage_service.dart';


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
  void initState() {

    super.initState();

    load();

  }



  Future<void> load() async {

    configs =
    await StorageService.loadConfigs();

    setState(() {});

  }



  Future<void> delete(int index) async {

    configs.removeAt(index);

    await StorageService.saveConfigs(configs);

    setState(() {});

  }



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

        child:

        Text(
          "No Configs Yet"
        ),

      )


      :

      ListView.builder(

        itemCount:
        configs.length,


        itemBuilder:
        (context,index){


          final c =
          configs[index];


          return Card(

            margin:
            const EdgeInsets.all(10),


            child:
            ListTile(


              title:
              Text(
                c.name
              ),


              subtitle:
              Text(
                "${c.type}\n🟢 Online"
              ),


              trailing:
              PopupMenuButton(

                onSelected:(v){

                  if(v=="delete"){

                    delete(index);

                  }

                },


                itemBuilder:(context)=>[

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

              ),


            ),

          );


        },


      ),


    );


  }

}
