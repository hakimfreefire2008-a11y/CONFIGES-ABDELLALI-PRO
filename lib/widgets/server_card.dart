import 'package:flutter/material.dart';


class ServerCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final VoidCallback onTap;


  const ServerCard({

    super.key,

    required this.title,

    required this.icon,

    required this.onTap,

  });


  @override
  Widget build(BuildContext context) {


    return InkWell(

      borderRadius: BorderRadius.circular(20),

      onTap:onTap,


      child: Card(

        elevation:6,

        shape:RoundedRectangleBorder(

          borderRadius:
          BorderRadius.circular(20),

        ),


        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,


          children:[


            Icon(

              icon,

              size:45,

              color:
              Theme.of(context)
                  .colorScheme
                  .primary,

            ),


            const SizedBox(height:15),


            Text(

              title,

              textAlign:TextAlign.center,


              style:const TextStyle(

                fontSize:16,

                fontWeight:
                FontWeight.bold,

              ),

            ),

          ],

        ),

      ),

    );

  }
}
