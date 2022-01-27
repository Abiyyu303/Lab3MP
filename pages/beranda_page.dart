import 'package:flutter/material.dart';
import 'package:my_first_flutter/pages/camera_page.dart';
import 'package:my_first_flutter/pages/gridwisata_page.dart';
import 'package:my_first_flutter/pages/listwisata_page.dart';
import 'package:my_first_flutter/pages/whasapp_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'berita_page.dart';
import 'login_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        actions: [
          IconButton(
            onPressed: () async {
              tampilAlert(context);
             
            },
            icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
        Flexible(
          child: Row(
            children: [
              TampilanMenu(
                Colors.red, "assets/gambar/tech1.png", "ListHotel", context, const ListwisataPage()
              ),
              TampilanMenu(
                Colors.yellow, "assets/gambar/kamera.png",  "Camera", context, const CameraPage()
              ),
            
            ],
            
          ),
        ),
        Flexible(
          child: Row(
            children: [
               TampilanMenu(
                Colors.yellow, "assets/gambar/tech1.png", "Whasapp",context, const WhasappPage()
              ),
              TampilanMenu(
                Colors.red, "assets/gambar/tech1.png",  "Gridwisata", context, const GridwisataPage()
              ),
            ],
            
          ),
        ),
        Flexible(
          child: Row(
            children: [
               TampilanMenu(
                Colors.red, "assets/gambar/tech1.png", "Berita",context,  BeritaPage()
              ),
              TampilanMenu(
                Colors.yellow, "assets/gambar/tech1.png",  "Info", context, const GridwisataPage()
              ),
            ],
            
          ),
        )
        
      ],
        
      )
      
    );
  }
  Widget TampilanMenu(Color? warna, String? gambar, String? text, BuildContext context, Widget kelasTujuan){
    return Flexible(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
          context, MaterialPageRoute(builder: (context) => kelasTujuan));
                  },
                  child: Container(
                    width: double.infinity,
                    color: warna,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          gambar ??"-",
                        width:100,
                        height:100
                        ),
                    
                        Text(text ??'-')
                      ],
                    ),
                  ),
                ),
              );
  }

  void tampilAlert(BuildContext context) {
    Widget cancel = TextButton(
      onPressed: (){
        //kembali kehalaman sebelumnya
        Navigator.pop(context);
      },
      child: Text("Cancel"));

      Widget yes = TextButton(
        onPressed: () async {
           SharedPreferences preferences = 
              await SharedPreferences.getInstance();
              preferences.clear();
              //pindah ke halaman login setelah logout
              Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) => LoginPage()));

        },
        child: Text("Yes"));
        AlertDialog alert = AlertDialog(
          title: Text("Keluar Aplikasi"),
          content: Text("Apakah and yakin keluar aplikasi ?"),
          actions: [cancel, yes],
        );
        showDialog(context: context, builder: (context){
          return alert;
        });
  }
}