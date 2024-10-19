import 'package:flutter/material.dart';

class ComparisonPage extends StatefulWidget {
  @override
  _ComparisonPageState createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  String? selectedOS1;
  String? selectedOS2;

  final List<String> operatingSystems = [
    'Android',
    'iOS',
    'Windows Phone',
    'Palm OS',
    'SymBian',
    'BlackBerry OS',
    'Tizen',
    'Ubuntu Touch',
    'Cyanogenmod',
    'MeeGo',
    'Sailfish',
    'Firefox OS',
    'Open WebOS'
  ];

  // İşletim sistemlerine göre sabit kriterleri tanımlıyoruz.
  final Map<String, Map<String, String>> comparisonData = {
    'Android': {
      'Performans': 'Yüksek',
      'Uygulama Çeşitliliği': 'Çok Geniş',
      'Güvenlik': 'Orta',
    },
    'iOS': {
      'Performans': 'Yüksek',
      'Uygulama Çeşitliliği': 'Geniş',
      'Güvenlik': 'Yüksek',
    },
    'Windows Phone': {
      'Performans': 'Orta',
      'Uygulama Çeşitliliği': 'Az',
      'Güvenlik': 'Yüksek',
    },
    'Palm OS': {
      'Performans': 'Düşük',
      'Uygulama Çeşitliliği': 'Çok Az',
      'Güvenlik': 'Orta',
    },
    'SymBian': {
      'Performans': 'Düşük',
      'Uygulama Çeşitliliği': 'Orta',
      'Güvenlik': 'Orta',
    },
    'BlackBerry OS': {
      'Performans': 'Orta',
      'Uygulama Çeşitliliği': 'Az',
      'Güvenlik': 'Yüksek',
    },
    'Tizen': {
      'Performans': 'Orta',
      'Uygulama Çeşitliliği': 'Sınırlı',
      'Güvenlik': 'Yüksek',
    },
    'Ubuntu Touch': {
      'Performans': 'Orta',
      'Uygulama Çeşitliliği': 'Orta',
      'Güvenlik': 'Yüksek',
    },
    'Cyanogenmod': {
      'Performans': 'Yüksek',
      'Uygulama Çeşitliliği': 'Geniş',
      'Güvenlik': 'Orta',
    },
    'MeeGo': {
      'Performans': 'Orta',
      'Uygulama Çeşitliliği': 'Sınırlı',
      'Güvenlik': 'Orta',
    },
    'Sailfish': {
      'Performans': 'Orta',
      'Uygulama Çeşitliliği': 'Sınırlı',
      'Güvenlik': 'Yüksek',
    },
    'Firefox OS': {
      'Performans': 'Düşük',
      'Uygulama Çeşitliliği': 'Az',
      'Güvenlik': 'Orta',
    },
    'Open WebOS': {
      'Performans': 'Düşük',
      'Uygulama Çeşitliliği': 'Çok Az',
      'Güvenlik': 'Orta',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İşletim Sistemi Karşılaştırma'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'İki işletim sistemi seçin ve karşılaştırın:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // İşletim sistemi seçimi için iki DropdownButton ekliyoruz.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                hint: Text('İlk OS\'yi Seçin'),
                value: selectedOS1,
                items: operatingSystems.map((String os) {
                  return DropdownMenuItem<String>(
                    value: os,
                    child: Text(os),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOS1 = newValue;
                  });
                },
              ),
              DropdownButton<String>(
                hint: Text('İkinci OS\'yi Seçin'),
                value: selectedOS2,
                items: operatingSystems.map((String os) {
                  return DropdownMenuItem<String>(
                    value: os,
                    child: Text(os),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOS2 = newValue;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          // Karşılaştırma butonu
          ElevatedButton(
            onPressed: selectedOS1 != null && selectedOS2 != null
                ? () {
              _showComparison();
            }
                : null,
            child: Text('Karşılaştır'),
          ),
          SizedBox(height: 20),
          selectedOS1 != null && selectedOS2 != null
              ? Expanded(child: _buildComparisonTable())
              : Container(),
        ],
      ),
    );
  }

  // Seçilen işletim sistemlerinin karşılaştırma tablosu
  Widget _buildComparisonTable() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Özellikler', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(selectedOS1!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(selectedOS2!),
            ),
          ]),
          _buildComparisonRow('Performans'),
          _buildComparisonRow('Uygulama Çeşitliliği'),
          _buildComparisonRow('Güvenlik'),
        ],
      ),
    );
  }

  // Karşılaştırma verilerini tabloya ekleyen fonksiyon
  TableRow _buildComparisonRow(String feature) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(feature),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(comparisonData[selectedOS1]?[feature] ?? 'Bilinmiyor'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(comparisonData[selectedOS2]?[feature] ?? 'Bilinmiyor'),
      ),
    ]);
  }

  void _showComparison() {
    setState(() {});
  }
}
