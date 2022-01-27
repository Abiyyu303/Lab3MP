import 'package:flutter/material.dart';
import 'package:my_first_flutter/widget/gridwisata_widger.dart';
import 'package:my_first_flutter/widget/listwisata_widget.dart';

class WhasappPage extends StatefulWidget {
  const WhasappPage({ Key? key }) : super(key: key);

  @override
  State<WhasappPage> createState() => _WhasappPageState();
}

class _WhasappPageState extends State<WhasappPage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState(){
    //TODO: implement inistatae
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhasApp"),
        bottom:  TabBar(
         controller:controller,
          indicatorColor: Colors.white, 
          tabs: const [
          Tab(
            text: "list wisata",
            ),
            Tab(
            text: "Grid wisata",
            ),
            Tab(
            text: "Gambar wisata",
            ),
        ]),
      ),
      body: TabBarView(controller : controller, children:  [
        listWisata(),
        gridWisata(),
        Center(child: Text("ListView")),
      ]),
    );
  }}