import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:my_first_flutter/model/berita_model.dart';


class webBeritaPage extends StatelessWidget {
  final Articles? berita;
  const webBeritaPage({ Key? key, this.berita }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: berita!.url!,
      // appBar: AppBar(
      //   title: Text(wisata!.namaWisata!) ,
      // ),
      
    );
  }
}