import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class HcFilesScreen extends StatelessWidget {

  const HcFilesScreen({super.key});


  final files = const [

    {
      "name":"Config Morocco 01",
      "country":"🇲🇦 Morocco",
      "url":"https://example.com/config01.hc"
    },

    {
      "name":"Config France 01",
      "country":"🇫🇷 France",
      "url":"https://example.com/config02.hc"
    },

  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar:AppBar(
        title:
        const Text("HTTP CUSTOM FILES"),
      ),



      body:ListView.builder(

        itemCount:files.length,


        itemBuilder:(context,index){


          final file =
          files[index];


          return Card(

            child:ListTile(


              leading:
              const Icon(
                Icons.file_download,
              ),


              title:
              Text(
                file["name"]!,
              ),


              subtitle:
              Text(
                file["country"]!,
              ),



              trailing:
              ElevatedButton(

                child:
                const Text("تحميل"),


                onPressed:() async{


                  final uri =
                  Uri.parse(
                    file["url"]!,
                  );


                  if(await canLaunchUrl(uri)){

                    await launchUrl(uri);

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
