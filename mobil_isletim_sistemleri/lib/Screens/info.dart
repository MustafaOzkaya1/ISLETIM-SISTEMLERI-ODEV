import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Uygulama Hakkında",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mobil İşletim Sistemleri Hakkında",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Mobil işletim sistemleri, taşınabilir cihazlarda kullanılan yazılımlardır. "
                  "Android, iOS, Windows Phone gibi popüler işletim sistemleri kullanıcılarına "
                  "çeşitli özellikler ve uygulamalar sunar. Mobil işletim sistemleri, "
                  "donanımları yönetir ve kullanıcıların cihazlarıyla etkileşim kurmasına olanak tanır.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Popüler Mobil İşletim Sistemleri",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "- Android: Google tarafından geliştirilen ve dünya çapında en yaygın kullanılan "
                  "açık kaynaklı bir mobil işletim sistemidir.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "- iOS: Apple tarafından geliştirilen ve sadece Apple cihazlarında kullanılan kapalı "
                  "kaynaklı bir mobil işletim sistemidir.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "- Windows Phone: Microsoft tarafından geliştirilen ancak 2017'de desteği sona eren "
                  "bir mobil işletim sistemidir.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            Text(
              "NOT:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Anasayfadaki bilgiler için ister üstüne tıklayabilir istersenizde aşağı kaydırabilirsiniz",
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            SizedBox(height: 10),
            Text(
              "İletişim",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "E-posta: mustafaozkaya4221@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
