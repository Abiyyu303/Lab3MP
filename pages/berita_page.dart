import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter/model/berita_model.dart';
import 'package:my_first_flutter/network/api.dart';
import 'package:my_first_flutter/pages/detailberita_page.dart';


class BeritaPage extends StatefulWidget {
  BeritaPage({Key? key, BeritaModel? berita}) : super(key: key);

  @override
  _BeritaPageStateState createState() => _BeritaPageStateState();
}

class _BeritaPageStateState extends State<BeritaPage> {
  bool? loading;

  List<Articles>? reponseBerita;
  @override
  void initState() {
    // TODO:implement.initState
    getDataBerita();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title : Text("Portal Berita"),
      ),
      body : loading == true 
      ? Center (
        child : CircularProgressIndicator(),
    )
    : ListView.builder(
      itemCount : reponseBerita?.length,
      itemBuilder: (context, index) {
        Articles? berita = reponseBerita?[index];
        return GestureDetector(
           onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailberitaPage(beritaDetail: berita,))
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      berita?.urlToImage ??
                      "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.dx-world.net%2Fwp-content%2Fuploads%2F2017%2F10%2Fno-news-good-news.png&imgrefurl=https%3A%2F%2Fwww.dx-world.net%2Fno-news-updates-soon%2F&tbnid=dLwOdFJ16pbDKM&vet=12ahUKEwj1x5Kfisz1AhUUQ3wKHQnmAnsQMygHegUIARDcAQ..i&docid=6oVCVdJNNOhPdM&w=800&h=446&itg=1&q=no%20news%20image&ved=2ahUKEwj1x5Kfisz1AhUUQ3wKHQnmAnsQMygHegUIARDcAQ",
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                      
                    ),
                  ),
                  Text (berita?.title ?? "-",
                  style : TextStyle(
                    fontSize: 15, fontWeight:  FontWeight.bold, color: Colors.white
                  )),
                  Text(berita?.publishedAt ?? "-",
                  style: TextStyle(
                    fontSize : 15,
                    fontWeight : FontWeight.bold,
                    color:  Colors.grey)),
                ],
              ),
            ),
          ),
        );
      }
    )
    );
  }

    Future<void> getDataBerita() async {
      loading = true;
      var res = await http.get(Uri.parse(API.BASE_URL));
      if (res.statusCode == 200) {
        print("Data berhasil ditangkap");
        var data = json.decode(res.body);
        var beritas = data["articles"] as List;
        setState(() {
          loading = false;
          reponseBerita = 
          beritas.map((value) => Articles.fromJson(value)).toList();
        });
      } else {}
    }
  }
