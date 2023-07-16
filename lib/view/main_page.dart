import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../util.dart';
import 'hotel_page.dart';
import 'search_page.dart';

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
      bottomNavigationBar: bottomNavbar(context, bottomBarPage),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("hotels").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }
            return Column(
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
                    return Container(
                      margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Image.asset(asset),
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: roundedButton(
                    context,
                    buttonText: "Hadi bir otel ara...",
                    onPressed: () {
                      navigateWithSlide(
                        context,
                        const SearchPage(),
                        SlideDirection.up,
                        replace: true,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((doc) {
                      final data = doc.data();
                      return hotelCard(context, data);
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
