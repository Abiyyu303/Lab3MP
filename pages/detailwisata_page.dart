import 'package:flutter/material.dart';
import 'package:my_first_flutter/pages/webwisata_page.dart';

import '../model/wisata_model.dart';

class DetailwisataPage extends StatelessWidget {
  WisataModel? wisataDetail;
   DetailwisataPage({ Key? key, this.wisataDetail }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisataDetail?.namaWisata ?? "-"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => WebWisataPage(
              wisata:wisataDetail,
            )));
          }, 
          icon: Icon(Icons.open_in_browser))
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/gambar/${wisataDetail?.gambar}",
              fit: BoxFit.fill,
            )),
            Text(
              "data",
              style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Alamat : ${wisataDetail?.alamatWisata}",
              style: TextStyle(fontSize: 25),
            )
        ],
      )
    );
  }}