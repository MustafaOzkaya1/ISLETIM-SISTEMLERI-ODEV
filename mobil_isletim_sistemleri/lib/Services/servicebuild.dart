import 'package:flutter/material.dart';
import 'package:dough/dough.dart';
import 'package:mobil_isletim_sistemleri/Screens/osdetails.dart';

// İşletim sistemine göre farklı renkler belirleyen fonksiyon

Color getBackgroundColor(String osName) {
  switch (osName) {
    case 'Android':
      return Colors.green;
    case 'iOS':
      return Colors.grey;
    case 'Windows Phone':
      return Colors.blue;
    case 'Palm OS':
      return Colors.brown;
    case 'SymBian':
      return Colors.purple;
    case 'BlackBerry OS':
      return Colors.black;
    case 'Tizen':
      return Colors.lightBlue;
    case 'Ubuntu Touch':
      return Colors.orange;
    case 'Cyanogenmod':
      return Colors.cyan;
    default:
      return Colors.grey[400]!;
  }
}

// İşletim sistemi detaylarını gösteren sayfa yapısı
Widget buildOsPageContent(String osName, String title, String content) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          osName, // İşletim sisteminin adı başlıkta gösteriliyor
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

// İşletim sistemi kartlarının sayfa yapısı
Widget buildOsCard(BuildContext context, String osName, Map<String, Map<String, String>> osDetails) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OSDetailPage(
            osName: osName,
            osDetails: osDetails[osName]!,
            backgroundColor: getBackgroundColor(osName),
          ),
        ),
      );
    },
    child: PressableDough(
      child: Container(
        width: 250,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: getBackgroundColor(osName),
          borderRadius: BorderRadius.circular(15),
        ),
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            buildOsPageContent(osName, "Genel Bilgi", osDetails[osName]?['Genel Bilgi'] ?? 'Bilgi bulunamadı.'),
            buildOsPageContent(osName, "Özellikler", osDetails[osName]?['Özellikler'] ?? 'Bilgi bulunamadı.'),
            buildOsPageContent(osName, "Sürüm Bilgileri", osDetails[osName]?['Sürüm Bilgileri'] ?? 'Bilgi bulunamadı.'),
            buildOsPageContent(osName, "Ekstra Bilgi", osDetails[osName]?['Ekstra Bilgi'] ?? 'Bilgi bulunamadı.'),
          ],
        ),
      ),
    ),
  );
}
