import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});


  Future<void> openLink(String link) async {
    final uri = Uri.parse(link);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "المساعدة والدعم",
        ),
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Card(
              child: ListTile(

                leading: const Icon(
                  Icons.phone,
                ),

                title: const Text(
                  "واتساب المطور",
                ),

                subtitle: const Text(
                  "+212714193084",
                ),

                onTap: () {

                  openLink(
                    "https://wa.me/212714193084",
                  );

                },

              ),
            ),



            Card(
              child: ListTile(

                leading: const Icon(
                  Icons.groups,
                ),

                title: const Text(
                  "قناة واتساب التطبيق",
                ),

                subtitle: const Text(
                  "CONFIGES ABDELLALI PRO",
                ),

                onTap: () {

                  openLink(
                    "https://whatsapp.com/channel/0029VbBJN2RFcow7OykfP02I",
                  );

                },

              ),
            ),



            Card(
              child: ListTile(

                leading: const Icon(
                  Icons.telegram,
                ),

                title: const Text(
                  "قناة تيليجرام",
                ),

                subtitle: const Text(
                  "abdellali84",
                ),

                onTap: () {

                  openLink(
                    "https://t.me/abdellali84",
                  );

                },

              ),
            ),



            Card(
              child: ListTile(

                leading: const Icon(
                  Icons.camera_alt,
                ),

                title: const Text(
                  "انستغرام المطور",
                ),

                subtitle: const Text(
                  "abde_llali84",
                ),

                onTap: () {

                  openLink(
                    "https://www.instagram.com/abde_llali84",
                  );

                },

              ),
            ),



            const SizedBox(
              height: 20,
            ),



            Card(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,


                  children: const [

                    Text(
                      "الأسئلة الشائعة FAQ",
                      style: TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.bold,
                      ),
                    ),


                    SizedBox(
                      height:10,
                    ),


                    Text(
                      """
1- كيف أستعمل السيرفرات؟
اختر نوع السيرفر ثم اختر السيرفر المناسب وانسخ البيانات.


2- كيف أحمل ملفات HTTP CUSTOM؟
ادخل إلى قسم HTTP CUSTOM واضغط تحميل.


3- هل يتم تحديث السيرفرات؟
نعم، التطبيق يعتمد على ملف خارجي servers.json ويمكن تحديثه بدون تحديث التطبيق.


4- هل التطبيق مجاني؟
نعم، التطبيق يوفر إدارة وعرض الكونفيجات بشكل مجاني.
""",
                      style: TextStyle(
                        fontSize:16,
                      ),
                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
