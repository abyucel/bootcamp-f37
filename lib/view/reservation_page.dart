import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../util.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _roomCountCtl = TextEditingController();
  final _childrenCountCtl = TextEditingController();
  final _adultCountCtl = TextEditingController();

  DateTime today = DateTime.now();
  DateTime maxDate = DateTime.now().add(const Duration(days: 365));
  DateTime entryDate = DateTime.now();
  DateTime leaveDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: StreamBuilder(
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
              children: [
                Expanded(
                  flex: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: MediaQuery.of(context).size.width / 8 + 4,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 8,
                            backgroundImage: Image.memory(
                              base64Decode(data["images"][0]),
                            ).image,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "${data["name"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          ratingBar(
                            data["stars"],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 70,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                roundedTextButton(
                                  context,
                                  buttonText:
                                      "${entryDate.day}/${entryDate.month}/${entryDate.year}",
                                  fontSize: 22.0,
                                  onPressed: () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: entryDate,
                                      firstDate: today,
                                      lastDate: maxDate,
                                    );
                                    if (date != null) {
                                      setState(() {
                                        entryDate = date;
                                      });
                                    }
                                  },
                                ),
                                const Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.grey,
                                  size: 32.0,
                                ),
                                roundedTextButton(
                                  context,
                                  buttonText:
                                      "${leaveDate.day}/${leaveDate.month}/${leaveDate.year}",
                                  fontSize: 22.0,
                                  onPressed: () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: leaveDate,
                                      firstDate: today,
                                      lastDate: maxDate,
                                    );
                                    if (date != null) {
                                      setState(() {
                                        leaveDate = date;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            customNumberField(
                              controller: _roomCountCtl,
                              hintText: "Oda sayısı",
                            ),
                            Column(
                              children: [
                                customNumberField(
                                  controller: _childrenCountCtl,
                                  hintText: "Çocuk sayısı",
                                ),
                                const SizedBox(height: 8.0),
                                customNumberField(
                                  controller: _adultCountCtl,
                                  hintText: "Yetişkin sayısı",
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                roundedButton(
                                  context,
                                  buttonText: "Ödeme yöntemi seç",
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                  textColor: Colors.black,
                                  onPressed: () {
                                    notifySnackbar(
                                      context,
                                      "Bu özellik kapalıdır.",
                                    );
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                roundedButton(
                                  context,
                                  buttonText: "Rezerve et",
                                  onPressed: () {
                                    notifySnackbar(
                                      context,
                                      "Bu özellik kapalıdır.",
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
