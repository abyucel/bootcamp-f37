import 'package:flutter/material.dart';

import '../util.dart';
import 'main_page.dart';
import 'profile_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bottomBarPage = 1;

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
