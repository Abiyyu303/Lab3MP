import 'package:flutter/material.dart';
import 'package:my_first_flutter/widget/gridwisata_widger.dart';

import '../data/wisata_data.dart';
import 'detailwisata_page.dart';
import '../model/wisata_model.dart';

class GridwisataPage extends StatelessWidget {
  const GridwisataPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridwisata"),
      ),
      body: gridWisata()
    );
  }}