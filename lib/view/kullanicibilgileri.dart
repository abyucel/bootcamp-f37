import 'package:ekotel/constants/theme.dart';
import 'package:flutter/material.dart';

class kullaniciBilgileriSayfasi extends StatefulWidget {
  @override
  _kullaniciBilgileriSayfasiState createState() =>
      _kullaniciBilgileriSayfasiState();
}

class _kullaniciBilgileriSayfasiState extends State<kullaniciBilgileriSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Düzenle',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/resimler/kullanıcı.png'))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.anaRenk),
                    child:
                        const Icon(Icons.edit, color: Colors.black, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Ad-Soyad'), prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('E-mail'), prefixIcon: Icon(Icons.mail)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Telefon Numarası'),
                      prefixIcon: Icon(Icons.phone)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: const Text('Şifre'),
                    prefixIcon: const Icon(Icons.fingerprint),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.private_connectivity),
                        onPressed: () {}),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.anaRenk,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text('Düzenlemeleri Kaydet',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent.withOpacity(0.2),
                      elevation: 0,
                      foregroundColor: AppColors.cikisYap,
                      shape: const StadiumBorder(),
                      side: BorderSide.none),
                  child: const Text('Sil'),
                ),
              ],
            )),
          ]),
        ),
      ),
    );
  }
}
