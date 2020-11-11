import 'package:flutter/material.dart';

import 'detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Adab App"),
        ),
        body: _PageList());
  }
}
//class
class _PageList extends StatefulWidget {
  _PageStateListState createState() => _PageStateListState();
}

class _PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Adab Makan dan Minum",
    "Adab Tidur",
    "Adab Berpakaian",
    "Adab Belajar",
    "Adab Buang Air"
  ];

  List<String> subjudul = [
    "",
    "",
    "",
    "",
    "",
  ];

  List<String> gambar = [
    "images/view.jpg",
    "images/view.jpg",
    "images/view.jpg",
    "images/view.jpg",
    "images/view.jpg",
  ];

  List<String> resep = [
    "Makan dan minum harus dengan posisi duduk, Tidak berbicara saat sedang makan, Menggunakan tangan kanan saat sedang makan, Tenang dan tidak tergesa-gesa saat makan, dan makanan tidak berceceran, Tidak makan sambil berjalan, Makan secukupnya dan tidak berlebihan, Tidak membicarakan hal-hal buruk saat makan",
    "Jangan begadang, Berwudhu, Bersihkan tempat tidur, Matikan lampu, Tutup wadah makanan, Membaca ayat Kursi, Membaca doa tidur",
    "Membaca doa, Memulai dengan anggota badan sebelah kanan., Tidak sombong., Tidak berpakaian dengan pakaian jahiliyah., Tidak menyerupai pakaian laki-laki atau perempuan., Tidak menyerupai pakaian pendeta., Tidak memakai sepatu sambil berdiri.",
    "Niat yang ikhlas, Beradab kepada orang yang memberi ilmu, Bersabar dalam menuntut ilmu, Tulis setiap apa yang dipelajari, Rendah diri, Menjauhi daripada kenyang berlebihan, Tidur yang cukup, Kurangkan kata2 yang tak bermanfaat",
    "Cari tempat tertutup, pakai alas kaki, dahului kaki kiri, tidak ditempat berteduh manusia, tidak mengobrol",
    ];

  List<String> sampel = [
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView.builder(
          itemCount: judul.length,
          itemBuilder: (BuildContext contex, int index) {
            final title = judul[index].toString();
            final subTitle = subjudul[index].toString();
            final img = gambar[index].toString();
            final sample = sampel[index].toString();
            final resepmakanan = resep[index].toString();
            return Container(
              height: 200,
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    backgroundImage(img),
                    Container(
                      child: topContent(title, sample, sample),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                            itemJudul: title,
                            itemImage: img,
                            itemSub: subTitle,
                            qty: resepmakanan,
                          )));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

backgroundImage(String gambar) {
  return new Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.luminosity),
            image: AssetImage(gambar))),
  );
}

topContent(String nama, String deskripsi, String sample) {
  return new Container(
    height: 150,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderText,
          ),
          Container(
            height: 1,
            width: 100,
            color: Colors.lightGreen,
          ),
          Text(
            deskripsi,
            style: descHeaderText,
          ),

          Text(
            sample,
            style: footerHeaderText,
          )
        ],
      ),
    ),
  );
}

final baseTextStyle = const TextStyle( fontFamily: 'arial');

final bigHeaderText =
baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

final descHeaderText =
baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white);

final footerHeaderText =
baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

final detailstyle =
baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
