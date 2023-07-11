import 'package:flutter/material.dart';
import 'package:ekotel/constants/theme.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Center(
          child: Column(children: <Widget>[
            Image.asset('assets/resimler/logo.png'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.anaRenk,
                minimumSize: const Size(
                    300, 40), // Düğmenin minimum genişliği ve yüksekliği
                padding: const EdgeInsets.all(12), // İçerik padding'i
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Düğme köşe yuvarlama
                ),
              ),
              child: const Text(
                "Giriş Yap",
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.girisyapbutonu,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.anaRenk,
                minimumSize: const Size(
                    300, 40), // Düğmenin minimum genişliği ve yüksekliği
                padding: const EdgeInsets.all(12), // İçerik padding'i
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Düğme köşe yuvarlama
                ),
              ),
              child: const Text(
                "Kayıt Ol",
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.girisyapbutonu,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.misafirGirisFont,
                minimumSize: const Size(
                    20, 40), // Düğmenin minimum genişliği ve yüksekliği
                padding: const EdgeInsets.all(12), // İçerik padding'i
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Düğme köşe yuvarlama
                ),
              ),
              child: const Text(
                'Google ile Giriş Yap',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.girisyapbutonu,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
