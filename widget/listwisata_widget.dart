import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/wisata_data.dart';
import 'package:my_first_flutter/model/wisata_model.dart';
import 'package:my_first_flutter/pages/detailwisata_page.dart';

Widget listWisata(){
  return ListView.builder(itemCount: WisataData.itemCount,
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
                child: Row(
                  children: [
                    Image.asset("assets/gambar/${wisata.gambar}",
                    width: 100,
                    height: 100,
                   fit: BoxFit.fill,
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
      } ) ;
}