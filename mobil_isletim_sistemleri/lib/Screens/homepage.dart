import 'package:flutter/material.dart';
import 'package:mobil_isletim_sistemleri/Screens/comparison_page.dart';
import 'package:mobil_isletim_sistemleri/Screens/info.dart';
import 'package:mobil_isletim_sistemleri/Screens/osdetails.dart';
import 'package:mobil_isletim_sistemleri/Services/servicebuild.dart';

class MobileOSPage extends StatefulWidget {
  @override
  _MobileOSPageState createState() => _MobileOSPageState();
}

class _MobileOSPageState extends State<MobileOSPage> {
  int _selectedCategory = 0;
  final List<String> categories = ['Popüler', 'Eski', 'Açık Kaynak'];
  final Map<String, List<String>> osList = {
    'Popüler': ['Android', 'iOS', 'Windows Phone'],
    'Eski': ['Palm OS', 'SymBian', 'BlackBerry OS'],
    'Açık Kaynak': ['Tizen', 'Ubuntu Touch', 'Cyanogenmod'],
  };

  // İşletim sistemi detayları
  final Map<String, Map<String, String>> osDetails = {
    'Android': {
      'Genel Bilgi': 'Android, Google tarafından geliştirilen ve dünya çapında en yaygın kullanılan mobil işletim sistemidir. Linux tabanlıdır ve kullanıcının cihazını özelleştirmesine olanak tanır.',
      'Özellikler': 'Android, açık kaynaklıdır, geniş bir uygulama mağazası sunar ve birçok cihazda çalışır. Kullanıcı özgürlüğüne önem verir, sistem üzerinde çoklu özelleştirme seçenekleri sunar.',
      'Sürüm Bilgileri': 'En son sürüm: Android 14 - 2023',
      'Ekstra Bilgi': 'Dünya çapında milyonlarca cihazda kullanılıyor ve kullanıcılarına geniş bir uygulama ekosistemi sunuyor.'
    },
    'iOS': {
      'Genel Bilgi': 'iOS, Apple tarafından geliştirilen ve sadece Apple cihazlarında kullanılan bir mobil işletim sistemidir. Kullanıcılarına stabilite ve güvenlik sağlar.',
      'Özellikler': 'Kullanıcıların sistem üzerinde değişiklik yapmasına izin vermeyen bir yapısı vardır. App Store üzerinden yüksek kaliteli uygulamalar sunar.',
      'Sürüm Bilgileri': 'En son sürüm: iOS 18 - 2024',
      'Ekstra Bilgi': 'Sadece Apple cihazlarda çalışır ve sistemin kapalı yapısı nedeniyle güvenliği ön planda tutar.'
    },
    'Windows Phone': {
      'Genel Bilgi': 'Windows Phone, Microsoft tarafından geliştirilen ve Windows ekosistemine entegre bir mobil işletim sistemiydi. Ancak 2017’de desteği sona erdi.',
      'Özellikler': 'Metro arayüzü ile modern bir görünüm sunuyordu ancak uygulama eksikliği nedeniyle popülaritesi azaldı.',
      'Sürüm Bilgileri': 'Son sürüm: Windows Phone 8.1 - 2014',
      'Ekstra Bilgi': 'Windows Phone, zamanında yenilikçi olmasına rağmen yeterli uygulama ekosistemi oluşturamadığı için pazarda kalıcı olamadı.'
    },
    'Palm OS': {
      'Genel Bilgi': 'Palm OS, PDA (Personal Digital Assistant) cihazları için geliştirilen bir işletim sistemiydi.',
      'Özellikler': 'Dokunmatik ekran desteği ve basit uygulamalarla hafif ve kullanıcı dostuydu.',
      'Sürüm Bilgileri': 'Son sürüm: Palm OS 5 - 2009',
      'Ekstra Bilgi': 'Akıllı telefonların yaygınlaşmasından önce popülerdi, ancak günümüz mobil cihazlarının taleplerini karşılayamadı.'
    },
    'SymBian': {
      'Genel Bilgi': 'Symbian, özellikle Nokia tarafından kullanılan, bir zamanlar en popüler mobil işletim sistemiydi.',
      'Özellikler': 'Düşük donanım gereksinimleri ve geniş uygulama desteğiyle birçok telefonda çalıştı.',
      'Sürüm Bilgileri': 'Son sürüm: Symbian Belle - 2011',
      'Ekstra Bilgi': 'Akıllı telefonların yükselmesiyle popülerliğini kaybetti ve yerini Android ve iOS’a bıraktı.'
    },
    'BlackBerry OS': {
      'Genel Bilgi': 'BlackBerry OS, BlackBerry telefonlarında kullanılan kapalı kaynaklı bir mobil işletim sistemiydi.',
      'Özellikler': 'Güvenlik ve e-posta entegrasyonu ile ünlüydü. İş dünyasında yaygın kullanıma sahipti.',
      'Sürüm Bilgileri': 'Son sürüm: BlackBerry OS 10 - 2013',
      'Ekstra Bilgi': 'Güçlü klavye desteği ve güvenlik önlemleriyle iş dünyasında popülerdi, ancak modern akıllı telefonlarla rekabet edemedi.'
    },
    'Tizen': {
      'Genel Bilgi': 'Tizen, Samsung tarafından geliştirilen açık kaynaklı bir mobil işletim sistemidir.',
      'Özellikler': 'Linux tabanlıdır ve akıllı saatler, televizyonlar ve bazı mobil cihazlar gibi geniş bir cihaz yelpazesinde kullanılır.',
      'Sürüm Bilgileri': 'En son sürüm: Tizen 6 - 2020',
      'Ekstra Bilgi': 'Özellikle Samsung’un akıllı saatlerinde kullanılan Tizen, mobil pazarda çok fazla yer edinememiştir.'
    },
    'Ubuntu Touch': {
      'Genel Bilgi': 'Ubuntu Touch, Linux tabanlı bir mobil işletim sistemidir ve mobil cihazlara özgürlük ve esneklik getirmeyi amaçlar.',
      'Özellikler': 'Açık kaynak kodlu ve esnek, özelleştirilebilir bir sistemdir. Mobil cihazlarda tam bir Ubuntu deneyimi sunar.',
      'Sürüm Bilgileri': 'En son sürüm: Ubuntu Touch OTA-22 - 2022',
      'Ekstra Bilgi': 'Özellikle teknoloji meraklıları ve geliştiriciler tarafından kullanılan Ubuntu Touch, topluluk destekli bir projedir.'
    },
    'Cyanogenmod': {
      'Genel Bilgi': 'CyanogenMod, Android tabanlı özelleştirilmiş bir ROM’du ve kullanıcılarına daha fazla kontrol ve özelleştirme sunuyordu.',
      'Özellikler': 'Hızlı, özelleştirilebilir ve güvenlik yamalarıyla sürekli güncellenen bir sistemdi.',
      'Sürüm Bilgileri': 'Son sürüm: CyanogenMod 14.1 - 2016',
      'Ekstra Bilgi': 'CyanogenMod projesi daha sonra LineageOS adı altında devam etti.'
    },
    'MeeGo': {
      'Genel Bilgi': 'MeeGo, Intel ve Nokia tarafından geliştirilen bir mobil işletim sistemiydi.',
      'Özellikler': 'Mobil cihazlarda, tabletlerde ve netbooklarda kullanılmak üzere tasarlanmıştı.',
      'Sürüm Bilgileri': 'Son sürüm: MeeGo 1.2 - 2011',
      'Ekstra Bilgi': 'MeeGo’nun geliştirilmesi durdurulmuş ve Tizen’e geçiş yapılmıştır.'
    },
    'Sailfish': {
      'Genel Bilgi': 'Sailfish OS, Jolla tarafından geliştirilen bir Linux tabanlı mobil işletim sistemidir.',
      'Özellikler': 'Kullanıcı dostu arayüzü ve çoklu görev desteği ile dikkat çeker. Android uygulamaları çalıştırma özelliğine sahiptir.',
      'Sürüm Bilgileri': 'En son sürüm: Sailfish OS 4 - 2021',
      'Ekstra Bilgi': 'Sailfish OS, kullanıcı gizliliğine önem verir ve alternatif bir mobil işletim sistemi olarak öne çıkar.'
    },
    'Firefox OS': {
      'Genel Bilgi': 'Firefox OS, Mozilla tarafından geliştirilen ve web tabanlı uygulamalar çalıştıran bir mobil işletim sistemiydi.',
      'Özellikler': 'Açık web standartlarını kullanarak geliştiricilerin HTML5 tabanlı uygulamalar yazmasına olanak tanır.',
      'Sürüm Bilgileri': 'Son sürüm: Firefox OS 2.6 - 2016',
      'Ekstra Bilgi': 'Mozilla, Firefox OS’un geliştirilmesini durdurdu, ancak bu fikir daha sonra başka platformlarda yaşamaya devam etti.'
    },
    'Open WebOS': {
      'Genel Bilgi': 'Open WebOS, HP tarafından geliştirilen ve daha sonra açık kaynaklı hale getirilen bir mobil işletim sistemidir.',
      'Özellikler': 'Çoklu görev desteği ve web tabanlı uygulama geliştirme araçlarıyla öne çıkar.',
      'Sürüm Bilgileri': 'Son sürüm: LuneOS - 2018',
      'Ekstra Bilgi': 'WebOS, LG tarafından akıllı televizyonlarda kullanılmak üzere yeniden hayata döndürülmüştür.'
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mobil İşletim Sistemleri',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen()));
            },
            icon: Icon(Icons.info_outline, color: Colors.white),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedCategory,
        onTap: (index) {
          setState(() {
            _selectedCategory = index;
          });
        },
        items: List.generate(categories.length, (index) {
          IconData icon;
          if (categories[index] == 'Popüler') {
            icon = Icons.star;
          } else if (categories[index] == 'Eski') {
            icon = Icons.history;
          } else if (categories[index] == 'Açık Kaynak') {
            icon = Icons.code;
          } else {
            icon = Icons.phone_android;
          }

          return BottomNavigationBarItem(
            icon: Icon(icon),
            label: categories[index],
          );
        }),
      ),
      body: Column(
        children: [
          _buildCategoryTitle(),
          Expanded(child: _buildOsCarousel()),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          // Kullanıcıyı karşılaştırma sayfasına yönlendiriyoruz
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComparisonPage(), // Karşılaştırma sayfasına yönlendirme
            ),
          );
        },
        label: Text('Karşılaştır'),
        icon: Icon(Icons.compare,),
      ),
    );
  }
  Widget _buildCategoryTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        categories[_selectedCategory],
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOsCarousel() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: osList[categories[_selectedCategory]]!.length,
      itemBuilder: (context, index) {
        String os = osList[categories[_selectedCategory]]![index];
        return buildOsCard(context, os, osDetails);
      },
    );
  }
}
