import 'package:flutter/material.dart';
import 'package:my_first_flutter/model/berita_model.dart';
import 'package:my_first_flutter/pages/webberita_page.dart';
import 'package:my_first_flutter/pages/webwisata_page.dart';

import 'berita_page.dart';



class DetailberitaPage extends StatelessWidget {
  Articles? beritaDetail;
   DetailberitaPage ({ Key? key, this.beritaDetail }) : super(key: key);

  get berita => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beritaDetail?.author ?? "-"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => webBeritaPage(
              berita: beritaDetail,
            )));
          }, 
          icon: Icon(Icons.open_in_browser))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                beritaDetail?.urlToImage ??'',
                fit: BoxFit.fill,
              )),
              Text(
                "data",
                style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Description : ${beritaDetail?.description}",
                style: TextStyle(fontSize: 25),
              )
          ],
        ),
      )
    );
  }}