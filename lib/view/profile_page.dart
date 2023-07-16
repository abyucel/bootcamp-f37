import 'package:flutter/material.dart';

import '../util.dart';
import 'main_page.dart';
import 'search_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bottomBarPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32),
            label: "Ana sayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 32),
            label: "Arama",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 32),
            label: "Profil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 32),
            label: "Bildirimler",
          ),
        ],
        currentIndex: bottomBarPage,
        selectedItemColor: Colors.amber,
        onTap: (i) {
          if (i == bottomBarPage) return;
          final routes = [
            const MainPage(),
            const SearchPage(),
            const ProfilePage(),
            const TestPage("NotificationPage"),
          ];
          navigateWithSlide(
            context,
            routes[i],
            SlideDirection.up,
            replace: true,
          );
        },
      ),
    );
  }
}
