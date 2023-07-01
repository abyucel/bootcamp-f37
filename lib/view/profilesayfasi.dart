import 'package:ekotel/app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({super.key});

  @override
  State<ProfilSayfasi> createState() => _ProfilSayfasiState();
}

int buttonIndex = 0;

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/resimler/a.png',
                  height: 280,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // Kenarlık rengini belirtin
                        width: 3.0, // Kenarlık kalınlığını belirtin
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 90,
                      backgroundImage:
                          AssetImage('assets/resimler/kullanıcı.png'),
                      backgroundColor: AppColors.anaRenk,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                ' Ahmet Öztürk,',
                style: TextStyle(
                  fontFamily: 'RobotoRegular',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              'ahmet.oztrk1@gmail.com',
              style: TextStyle(
                fontFamily: 'RobotoRegular',
                fontSize: 15,
                color: AppColors.aramaLogosu,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(
                        100, 30), // Düğmenin minimum genişliği ve yüksekliği
                    padding: const EdgeInsets.all(10), // İçerik padding'i
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Düğme köşe yuvarlama
                    ),
                    elevation: 4,
                    shadowColor: AppColors.anaRenk,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.square_stack_3d_down_right_fill,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                      Spacer(),
                      Text(
                        "Geçmiş Tatiller",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'RobotoLight',
                          color: AppColors.siyah,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(
                        100, 30), // Düğmenin minimum genişliği ve yüksekliği
                    padding: const EdgeInsets.all(10), // İçerik padding'i
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Düğme köşe yuvarlama
                    ),
                    elevation: 4,
                    shadowColor: AppColors.anaRenk,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.person_fill,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                      Spacer(),
                      Text(
                        "Kullanıcı Bilgileri",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'RobotoLight',
                          color: AppColors.siyah,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(
                        100, 30), // Düğmenin minimum genişliği ve yüksekliği
                    padding: const EdgeInsets.all(10), // İçerik padding'i
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Düğme köşe yuvarlama
                    ),
                    elevation: 4,
                    shadowColor: AppColors.anaRenk,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.gear_alt_fill,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                      Spacer(),
                      Text(
                        "Ayarlar",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'RobotoLight',
                          color: AppColors.siyah,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(
                        100, 30), // Düğmenin minimum genişliği ve yüksekliği
                    padding: const EdgeInsets.all(10), // İçerik padding'i
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Düğme köşe yuvarlama
                    ),
                    elevation: 4,
                    shadowColor: AppColors.anaRenk,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.globe,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                      Spacer(),
                      Text(
                        "Dil",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'RobotoLight',
                          color: AppColors.siyah,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: AppColors.siyah,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Çıkış yapılacak işlemler
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.square_arrow_right_fill,
                    size: 30,
                    color: AppColors.cikisYap,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Çıkış Yap',
                    style: TextStyle(
                      color: AppColors.cikisYap,
                      fontSize: 20,
                      fontFamily: 'RobotoMedium',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: buttonIndex,
        onTap: (index) {
          setState(() {
            buttonIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: AppColors.anaRenk,
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              backgroundColor: AppColors.anaRenk,
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: AppColors.anaRenk,
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              backgroundColor: AppColors.anaRenk,
              label: ''),
        ],
      ),
    );
  }
}
