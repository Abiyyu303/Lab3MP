import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/wisata_data.dart';
import 'package:my_first_flutter/model/wisata_model.dart';
import 'package:my_first_flutter/pages/detailwisata_page.dart';

Widget gridWisata(){
  return GridView.builder(
        itemCount: WisataData.itemCount,
        gridDelegate: 
      SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),
      itemBuilder: (context, index) {
        WisataModel wisata = WisataData.getItemWisata(index)!;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailwisataPage(wisataDetail: wisata,))
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 7,
              color : Colors.red,
              shadowColor: Colors.red[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        height:double.infinity,
                        width:double.infinity,
                        child: Image.asset("assets/gambar/${wisata.gambar}",
                        width: 100,
                        height: 100,
                                     fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left:20),
                    child: Text(
                      wisata.namaWisata ?? "-",
                      style: TextStyle(fontSize:20, fontWeight: FontWeight.bold , color: Colors.white)
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      });
}