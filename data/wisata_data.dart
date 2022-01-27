import 'package:my_first_flutter/model/wisata_model.dart';

class WisataData {
//set Data Wisata
  static var itemWisata = [
    WisataModel(
        namaWisata: "Hotel Alexis",
        alamatWisata:
            "Jl. Pegangsaan Dua No.10, RW.3, Pegangsaan Dua, Kec. Klp. Gading, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta ",
        gambar: "alexis.jpeg",
        webWisata:
            "https://www.mytrip.co.id/article/5-fakta-pasar-terapung-banjarmasin-nggak-kalah-dari-thailand"),
    WisataModel(
        namaWisata: "Hotel Atha Gading",
        alamatWisata: "Jl. Pegangsaan Indah Barat 1 Blok B No.81, RT.8/RW.16, Pegangsaan Dua, Kec. Klp. Gading, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta ",
        gambar: "Hotelartha.jpeg",
        webWisata:
            "https://id.wikipedia.org/wiki/Loksado,_Hulu_Sungai_Selatan"),
    WisataModel(
        namaWisata: "Vape Hotel",
        alamatWisata: "Komplek Nirwana Sunter Asri Bl J-2%2F5 Sunter Agung Tanjung Priok Jakarta Utara DKI Jakarta",
        gambar: "vape.jpeg",
        webWisata: "https://id.wikipedia.org/wiki/Muhammad_Arsyad_al-Banjari"),
    WisataModel(
        namaWisata: "Reddorz",
        alamatWisata: "Hotel Borobudur Lantai 1, Jl. Lapangan Banteng Selatan No. 1, Pasar Baru, Sawah Besar, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710",
        gambar: "red.jpeg",
        webWisata: "https://id.wikipedia.org/wiki/Bekantan"),
    WisataModel(
        namaWisata: "Haris Hotel",
        alamatWisata: "Jl. Boulevard Bar. Raya No.RT.13, RT.13/RW.18, Klp. Gading Tim., Kec. Klp. Gading, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14240",
        gambar: "haris.jpg",
        webWisata:
            "https://banjarmasin.tribunnews.com/2021/05/18/wisata-kalsel-taman-permana-pelaihari-langganan-jadi-tempat-prawedding"),
  ];

  // get all data
  static var itemCount = itemWisata.length; // 15 item

  //get data by index
  static WisataModel? getItemWisata(int index){
    return itemWisata[index];
  }
}
