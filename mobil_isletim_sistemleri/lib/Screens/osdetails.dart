import 'package:flutter/material.dart';

class OSDetailPage extends StatelessWidget {
  final String osName;
  final Map<String, String> osDetails;
  final Color backgroundColor;

  OSDetailPage({
    required this.osName,
    required this.osDetails,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(osName,style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: backgroundColor, // Arka plan rengini işletim sistemine göre ayarlıyoruz
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Genel Bilgi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              osDetails['Genel Bilgi'] ?? 'Bilgi bulunamadı.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Özellikler",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              osDetails['Özellikler'] ?? 'Bilgi bulunamadı.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Sürüm Bilgileri",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              osDetails['Sürüm Bilgileri'] ?? 'Bilgi bulunamadı.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Ekstra Bilgi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              osDetails['Ekstra Bilgi'] ?? 'Bilgi bulunamadı.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
