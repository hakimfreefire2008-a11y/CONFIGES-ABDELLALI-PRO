import 'package:flutter/material.dart';
import '../models/config.dart';


class CreateConfigScreen extends StatefulWidget {

  const CreateConfigScreen({super.key});


  @override
  State<CreateConfigScreen> createState() =>
      _CreateConfigScreenState();

}



class _CreateConfigScreenState
    extends State<CreateConfigScreen> {


  final nameController = TextEditingController();
  final hostController = TextEditingController();
  final portController = TextEditingController();

  final userController = TextEditingController();
  final passController = TextEditingController();

  final sniController = TextEditingController();

  final payloadController = TextEditingController();

  final proxyController = TextEditingController();


  String type = "SSH";


  bool payload = false;
  bool proxy = false;



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Create Config"
        ),
      ),


      body: Padding(

        padding: const EdgeInsets.all(16),

        child: ListView(

          children: [


            TextField(

              controller:nameController,

              decoration: const InputDecoration(

                labelText:"Config Name",

                border:
                OutlineInputBorder(),

              ),

            ),


            const SizedBox(height:15),



            DropdownButtonFormField(

              value:type,

              decoration: const InputDecoration(

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

                  child:Text(e),

                );

              }).toList(),


              onChanged:(v){

                setState((){

                  type=v.toString();

                });

              },


            ),



            const SizedBox(height:15),



            _field(
              hostController,
              "Host"
            ),


            _field(
              portController,
              "Port"
            ),


            _field(
              userController,
              "Username"
            ),


            _field(
              passController,
              "Password"
            ),



            _field(
              sniController,
              "SNI Domain"
            ),



            CheckboxListTile(

              title:
              const Text(
                "Enable Payload"
              ),

              value:payload,


              onChanged:(v){

                setState((){

                  payload=v!;

                });

              },

            ),



            if(payload)

              _field(
                payloadController,
                "Payload"
              ),




            CheckboxListTile(

              title:
              const Text(
                "Enable Proxy"
              ),

              value:proxy,


              onChanged:(v){

                setState((){

                  proxy=v!;

                });

              },

            ),



            if(proxy)

              _field(
                proxyController,
                "Proxy Host:Port"
              ),




            const SizedBox(height:20),



            ElevatedButton(

              onPressed:(){

                final config =
                ConfigModel(

                  id:
                  DateTime.now()
                  .millisecondsSinceEpoch
                  .toString(),

                  name:
                  nameController.text,

                  type:type,

                  host:
                  hostController.text,

                  port:
                  portController.text,

                  username:
                  userController.text,

                  password:
                  passController.text,

                  sni:
                  sniController.text,

                  payloadEnabled:
                  payload,

                  payload:
                  payloadController.text,

                  proxyEnabled:
                  proxy,

                  proxy:
                  proxyController.text,

                  createdAt:
                  DateTime.now(),

                );


                Navigator.pop(
                  context,
                  config
                );


              },


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




  Widget _field(
      TextEditingController c,
      String label
      ){

    return Padding(

      padding:
      const EdgeInsets.only(bottom:12),


      child:TextField(

        controller:c,

        decoration:
        InputDecoration(

          labelText:label,

          border:
          const OutlineInputBorder(),

        ),

      ),

    );

  }


}
