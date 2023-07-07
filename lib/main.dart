import 'package:ekotel/app/constants/theme.dart';
import 'package:ekotel/girissayfasi.dart';
import 'package:ekotel/view/bildirimler.dart';
import 'package:ekotel/view/profilesayfasi.dart';
import 'package:ekotel/view/searchpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'firebase_options.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    GirisSayfasi(),
    SearchPage(),
    BildirimSayfasi(),
    ProfilSayfasi(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          color: AppColors.anaRenk,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              backgroundColor: AppColors.anaRenk,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: AppColors.koyuMavi,
              gap: 8,
              padding: const EdgeInsets.all(12),
              tabs: const [
                GButton(
                  icon: CupertinoIcons.house_fill,
                  text: 'Ana Sayfa',
                ),
                GButton(
                  icon: CupertinoIcons.search,
                  text: 'Arama',
                ),
                GButton(
                  icon: CupertinoIcons.bell_fill,
                  text: 'Bildirimler',
                ),
                GButton(
                  icon: CupertinoIcons.person_fill,
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
