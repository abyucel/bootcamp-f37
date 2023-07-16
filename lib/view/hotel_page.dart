import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekotel/util.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  const HotelPage(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("hotels")
            .doc(widget.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 2,
                  autoPlay: true,
                  pauseAutoPlayOnManualNavigate: false,
                ),
                items: data["images"].map<Widget>((e) {
                  return Image.memory(base64Decode(e));
                }).toList(),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  data["name"],
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.call,
                                      size: 32.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.share,
                                      size: 32.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ratingBar(data["stars"]),
                                  const SizedBox(width: 8.0),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(6.0),
                                      color: Colors.amber,
                                      child: Text(
                                        " ${data["comments"].length} oy ",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              SizedBox(
                                child: Row(
                                  children: [
                                    ...atMost(data["comments"], 4).mapIndexed(
                                      (i, e) {
                                        return const CircleAvatar(
                                          radius: 16.0,
                                          backgroundImage: AssetImage(
                                            "assets/placeholder.jpg",
                                          ),
                                        );
                                      },
                                    ).toList()
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 16.0,
                              bottom: 16.0,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                data["description"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        iconButton(
                                          buttonText: "Geri Dönüşüm",
                                          icon: Icons.recycling,
                                        ),
                                        iconButton(
                                          buttonText: "Güvenlik",
                                          icon: Icons.lock,
                                        ),
                                        iconButton(
                                          buttonText: "Yeme içme",
                                          icon: Icons.restaurant,
                                        ),
                                        iconButton(
                                          buttonText: "Doğa dostu",
                                          icon: Icons.nature,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      top: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: roundedButton(
                                      context,
                                      buttonText: "Rezerve et",
                                      onPressed: () {
                                        navigateWithSlide(
                                          context,
                                          TestPage(
                                            "ReservationPage/${data["id"]}",
                                          ),
                                          SlideDirection.up,
                                        );
                                      },
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
