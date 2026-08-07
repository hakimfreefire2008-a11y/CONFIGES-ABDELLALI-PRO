import 'package:flutter/material.dart';
import '../models/config.dart';
import '../services/storage_service.dart';


class CreateConfigScreen extends StatefulWidget {

  const CreateConfigScreen({super.key});

  @override
  State<CreateConfigScreen> createState() =>
      _CreateConfigScreenState();

}



class _CreateConfigScreenState
    extends State<CreateConfigScreen> {


  final name =
  TextEditingController();

  final host =
  TextEditingController();

  final port =
  TextEditingController();

  final username =
  TextEditingController();

  final password =
  TextEditingController();

  final sni =
  TextEditingController();

  final payloadText =
  TextEditingController();

  final proxyText =
  TextEditingController();



  String type = "SSH";

  bool payload = false;

  bool proxy = false;



  Future<void> save() async {


    ConfigModel config =
    ConfigModel(

      id:
      DateTime.now()
      .millisecondsSinceEpoch
      .toString(),


      name:
      name.text,


      type:
      type,


      host:
      host.text,


      port:
      port.text,


      username:
      username.text,


      password:
      password.text,


      sni:
      sni.text,


      payloadEnabled:
      payload,


      payload:
      payloadText.text,


      proxyEnabled:
      proxy,


      proxy:
      proxyText.text,


      createdAt:
      DateTime.now(),

    );



    List<ConfigModel> list =
    await StorageService.loadConfigs();


    list.add(config);


    await StorageService.saveConfigs(list);



    Navigator.pop(context);


  }





  Widget field(
      TextEditingController c,
      String title
      ){

    return Padding(

      padding:
      const EdgeInsets.only(bottom:12),

      child:

      TextField(

        controller:c,

        decoration:
        InputDecoration(

          labelText:title,

          border:
          const OutlineInputBorder(),

        ),

      ),

    );

  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar:
      AppBar(

        title:
        const Text(
          "Create Config"
        ),

      ),



      body:
      Padding(

        padding:
        const EdgeInsets.all(16),


        child:
        ListView(


          children:[


            field(
              name,
              "Config Name"
            ),


            DropdownButtonFormField(

              value:type,

              decoration:
              const InputDecoration(

                labelText:"Type",

                border:
                OutlineInputBorder(),

              ),


              items:[

                "SSH",
                "VLESS",
                "VMESS",
                "TROJAN",
                "SLOW DNS",
                "UDP CUSTOM"

              ].map((e){

                return DropdownMenuItem(

                  value:e,

                  child:
                  Text(e),

                );

              }).toList(),



              onChanged:(v){

                setState((){

                  type =
                  v.toString();

                });

              },

            ),


            const SizedBox(height:15),


            field(host,"Host"),

            field(port,"Port"),

            field(username,"Username"),

            field(password,"Password"),

            field(sni,"SNI Domain"),



            SwitchListTile(

              title:
              const Text(
                "Enable Payload"
              ),

              value:payload,

              onChanged:(v){

                setState((){

                  payload=v;

                });

              },

            ),



            if(payload)

              field(
                payloadText,
                "Payload"
              ),




            SwitchListTile(

              title:
              const Text(
                "Enable Proxy"
              ),

              value:proxy,

              onChanged:(v){

                setState((){

                  proxy=v;

                });

              },

            ),



            if(proxy)

              field(
                proxyText,
                "Proxy Host:Port"
              ),



            const SizedBox(height:20),



            ElevatedButton(

              onPressed:save,

              child:
              const Text(
                "💾 Save Config"
              ),

            )


          ],


        ),


      ),


    );


  }

}
