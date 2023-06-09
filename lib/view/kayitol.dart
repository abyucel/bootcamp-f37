import 'package:flutter/material.dart';
import 'package:ekotel/constants/theme.dart';

class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({Key? key}) : super(key: key);

  @override
  State<KayitSayfasi> createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  TextEditingController adController = TextEditingController();
  TextEditingController soyadController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Image.asset(
                  'assets/resimler/d.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 180, 36, 0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 312,
                        height: 65,
                        child: Stack(
                          children: [
                            TextField(
                              controller: adController,
                              decoration: InputDecoration(
                                labelText: 'Ad',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: AppColors.girisyapbutonu,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 312,
                        height: 65,
                        child: Stack(
                          children: [
                            TextField(
                              controller: soyadController,
                              decoration: InputDecoration(
                                labelText: 'Soyad',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: AppColors.girisyapbutonu,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 312,
                        height: 65,
                        child: Stack(
                          children: [
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: AppColors.girisyapbutonu,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 312,
                        height: 65,
                        child: Stack(
                          children: [
                            TextField(
                              controller: sifreController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Şifre',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.girisyapbutonu,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 312,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            // Kayıt işlemlerini burada yapabilirsiniz
                            String ad = adController.text;
                            String soyad = soyadController.text;
                            String email = emailController.text;
                            String sifre = sifreController.text;

                            // Kayıt işlemlerini gerçekleştir
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.anaRenk,
                            minimumSize: const Size(312,
                                65), // Düğmenin minimum genişliği ve yüksekliği
                            padding:
                                const EdgeInsets.all(12), // İçerik padding'i
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Düğme köşe yuvarlama
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
