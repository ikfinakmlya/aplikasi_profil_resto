import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata  = <String, String>{};
 
  MainApp({super.key}){
    biodata ['name'] = 'Sweet Donat';
    biodata ['email'] = 'ikfina@gmail.com'; 
    biodata ['phone'] = '+6285325254975';
    biodata ['image'] = 'donat.jpg';
    // biodata ['hobby'] = 'membuat masalah';
    biodata ['addr'] = 'Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131';
    biodata ['desc'] = 
        '''Sweet Donat adalah toko donat yang menyajikan berbagai varian donat lezat dengan kualitas terbaik. Dengan bahan-bahan premium dan resep khusus, Sweet Donat menawarkan donat yang lembut di dalam dan renyah di luar, dipadukan dengan beragam topping dan isian yang menggugah selera. Nikmati kelezatan donat yang penuh cinta hanya di Sweet Donat!!''';
    biodata['list_menu'] = '''1. Donat Original Glaze\n2. Donat Coklat\n3. Donat Matcha\n4. Donat Strawberry Sprinkles\n5. Donat Coklat Sprinkles''';
    biodata['jam_buka'] = '''Senin - Jumat : 08.00 - 20.00
Sabtu - Minggu : 09.00 - 22.00''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sweet Donat",
      home: Scaffold(
        appBar: AppBar(title: const Text ("Sweet Donat")),
        // backgroundColor: Color(0xFFEECEB9),
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.0, -0.2071), 
              radius: 1.0,  // Menyesuaikan radius gradien
              colors: [
                Color(0xFFFbf3e6), // #fbf3e6
                Color(0xFFF9eddd), // #f9eddd
                Color(0xFFF7e5d3), // #f7e5d3
                Color(0xFFF5ddc9), // #f5ddc9
                Color(0xFFF4d3bf), // #f4d3bf
                Color(0xFFF2c9b5), // #f2c9b5
                Color(0xFFF0beac), // #f0beac
                Color(0xFFefb5a6), // #efb5a6
                Color(0xFFedaba1), // #edaba1
                Color(0xFFeca39f), // #eca39f
                Color(0xFFe99b9f), // #e99b9f
              ],
              stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], // Transisi warna
            ),
          ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children :[
            teksKotak(Color(0xFFCB80AB), biodata ['name']?? ''),
            SizedBox(height: 10),
            Image (image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.alternate_email, Color(0xFFFFD23F),
                "mailto:${biodata['email']}"), 
                btnContact(Icons.phone, Color(0xFF337357),
                "https://wa.me/${biodata['phone']}"), 
                btnContact(Icons.pin_drop, Color(0xFFEE4266),
                "https://www.google.com/maps/search/?api=1&query=${biodata['addr']}")
                ],
            ),
            // SizedBox(height: 10),
            // textAttribute("Hobby", biodata['hobby'] ?? ''),
            // textAttribute("Alamat", biodata['addr'] ?? ''),
            SizedBox(height: 10),
            teksKotak(Color(0xFFCB80AB), 'Deskripsi'),
            SizedBox(height: 10),
            Text(
              biodata['desc']?? '', 
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            teksKotak(Color(0xFFCB80AB), 'Varian Menu'),
            Text(
              biodata['list_menu']?? '', 
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
            // SizedBox(height: 10),
            teksKotak(Color(0xFFCB80AB), 'Alamat'),
            Text(
              biodata['addr']?? '', 
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            teksKotak(Color(0xFFCB80AB), 'Jam Operasional'),
            Text(
              biodata['jam_buka']?? '', 
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container (
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor), 
            child: Text(
              teks,
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20, 
                color: Colors.white)
            ), 

        );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
            children: [
              Container(
                width: 80,
                child: Text("- $judul", 
                  style: 
                    TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(": ", style: TextStyle(fontSize: 18)),
              Text(teks, style: TextStyle(fontSize: 18))
            ],
            );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      launch(uri);
                    },
                    child: Icon(icon),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
              );
  }

  void launch(String uri) async{
    if (!await launchUrl(Uri.parse(uri))){
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }
}
  