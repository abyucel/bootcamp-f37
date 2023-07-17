import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../util.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavbar(context, -1, noPage: true),
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            CustomPaint(
              painter: HeaderWavePainter(color: AppColors.blue),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.18,
              ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("hotels")
                    .doc(widget.id)
                    .snapshots(),
                builder: (context, hotelSnapshot) {
                  if (!hotelSnapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final hotelData = hotelSnapshot.data!;
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 32.0,
                      right: 32.0,
                      top: 16.0,
                      bottom: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Text(
                                hotelData["name"],
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            ratingBar(
                              hotelData["stars"],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          "Yorumlar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...hotelData["comments"]
                                    .map<Widget>((commentData) {
                                  final date =
                                      DateTime.fromMillisecondsSinceEpoch(
                                    commentData["created_at"],
                                  );
                                  final dateString =
                                      "${date.day}/${date.month}/${date.year}";
                                  final likes = commentData["likes"];
                                  return StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(commentData["user"])
                                        .snapshots(),
                                    builder: (context, userSnapshot) {
                                      if (!userSnapshot.hasData) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      final userData = userSnapshot.data!;
                                      final wid =
                                          MediaQuery.of(context).size.width /
                                              16;
                                      return Container(
                                        padding: const EdgeInsets.all(8.0),
                                        margin: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          top: 8.0,
                                        ),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: AppColors.blueDarker,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          AppColors.blue,
                                                      radius: wid + 4,
                                                      child: CircleAvatar(
                                                        radius: wid,
                                                        backgroundImage:
                                                            const AssetImage(
                                                          "assets/placeholder.jpg",
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${userData["first_name"]} ${userData["last_name"]}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          dateString,
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                AppColors.blue,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.more_horiz,
                                                    size: 32.0,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ratingBar(
                                                  commentData["rating"]),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                commentData["content"]!,
                                                style: const TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      notifySnackbar(
                                                        context,
                                                        "Bu özellik kapalı.",
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .emoji_emotions_outlined,
                                                          size: 26.0,
                                                        ),
                                                        const SizedBox(
                                                          width: 4.0,
                                                        ),
                                                        Text(
                                                          "$likes beğeni",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      notifySnackbar(
                                                        context,
                                                        "Bu özellik kapalı.",
                                                      );
                                                    },
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.reply,
                                                          size: 26.0,
                                                        ),
                                                        SizedBox(
                                                          width: 4.0,
                                                        ),
                                                        Text(
                                                          "Yanıtla",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
