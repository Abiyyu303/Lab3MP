import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vocsy_esys_flutter_share/vocsy_esys_flutter_share.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({ Key? key }) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  bool? loading;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
        actions: [
          IconButton(
            onPressed: (){
              shareFile();
            },
            icon: const Icon(Icons.share)
          )
        ],
      ),
      body: _image == null 
      ? const Center(child: Text("Belum ada Gambar"))
      : Column(
        children: [
          Image.file(
            _image!,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          loading == true 
          ? const CircularProgressIndicator()
          : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tampilanPilihan();
        },
        child: Icon(Icons.camera_alt),
        ),
    );
  }

  void tampilanPilihan() {
    
        AlertDialog alert = AlertDialog(
          title: Text("Keluar Aplikasi"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: () {
                    getImageFromCamera();
                  },
                  child: Text("Take a photo"),
          
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    getImageFromGalery();
                  },
                  child: Text("OPen Photo from galery"),
          
                )
            ],
            ),
          )
         
        );
        showDialog(context: context, builder: (context){
          return alert;
        });
  }

  Future<void> getImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    File file = File(photo!.path);
    setState(() {
      _image = file;
    });
    Navigator.pop(context);
  }

  Future<void> getImageFromGalery() async {
  final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    File file = File(photo!.path);
    setState(() {
      _image = file;
    });
    Navigator.pop(context);
  }

shareFile() {
  getByteFromFile().then((value){
    Share.file("Share Image file via", path.basename(_image!.path),
    value.buffer.asInt8List(), "image/png");
  });
}
    Future <ByteData> getByteFromFile() async {
      Uint8List bytes = File (_image!.path).readAsBytesSync();
      return ByteData.view(bytes.buffer);
    }
  
  }