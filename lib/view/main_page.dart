import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../util.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final rand = Random();
  final bottomBarPage = 0;

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
            label: "Otel ara",
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
            const TestPage("SearchPage"),
            const TestPage("ProfilePage"),
            const TestPage("NotificationPage"),
          ];
          navigateWithSlide(context, routes[i], SlideDirection.left);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: const Center(
              child: Text(
                "One With Nature",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              pauseAutoPlayOnManualNavigate: false,
              enlargeCenterPage: true,
            ),
            items: [
              "assets/reklam1.png",
              "assets/reklam2.png",
              "assets/reklam3.png",
            ].map((asset) {
              return Builder(
                builder: (BuildContext context) => Container(
                  margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Image.asset(asset),
                ),
              );
            }).toList(),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: roundedButton(
              context,
              buttonText: "Otel ara...",
              onPressed: () {
                navigateWithSlide(
                  context,
                  const TestPage("SearchPage"),
                  SlideDirection.down,
                );
              },
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("hotels").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              return Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((doc) {
                    final data = doc.data()! as Map<String, dynamic>;
                    return Container(
                      color: data["id"] % 2 == 0
                          ? const Color(0xEEEEEEFF)
                          : Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.memory(
                            base64Decode(data["images"][0]),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 200,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data["name"],
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    data["description"],
                                    maxLines: 3,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "Merkeze ${((rand.nextDouble() * 5).toStringAsPrecision(2))} km",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  ratingBar(data["stars"]),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
