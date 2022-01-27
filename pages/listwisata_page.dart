import 'package:flutter/material.dart';
import 'package:my_first_flutter/data/wisata_data.dart';
import 'package:my_first_flutter/model/wisata_model.dart';
import 'package:my_first_flutter/widget/listwisata_widget.dart';

import 'detailwisata_page.dart';

class ListwisataPage extends StatelessWidget {
  const ListwisataPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListWisata"),
      ),
      body: listWisata()
    );
  }}