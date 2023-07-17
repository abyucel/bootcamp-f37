import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../main.dart';
import '../util.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bottomBarPage = 1;

  final _hotelSearchCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNavbar(context, bottomBarPage),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(authService.auth.currentUser!.uid)
              .snapshots(),
          builder: (context, userSnapshot) {
            return StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("hotels").snapshots(),
              builder: (context, hotelsSnapshot) {
                if (!userSnapshot.hasData || !hotelsSnapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.blue),
                  );
                }
                final userData = userSnapshot.data!;
                final hotelsData = hotelsSnapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Merhaba, ${userData["first_name"]},",
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "hadi bir Ecotel ara!",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.blue,
                            radius: MediaQuery.of(context).size.width / 16 + 4,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width / 16,
                              backgroundImage: const AssetImage(
                                "assets/placeholder.jpg",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: customTextField(
                              controller: _hotelSearchCtl,
                              hintText: "Otel ara",
                              icon: Icons.search,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          IconButton(
                            icon: const Icon(
                              Icons.filter_list,
                              size: 32.0,
                            ),
                            onPressed: () {
                              // TODO filters
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: const Text(
                        "Popüler Ecoteller",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: 8.0,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.33,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            ...atMost(hotelsData.docs, 3).mapIndexed(
                              (e, i) => hotelCardAlt(
                                context,
                                MediaQuery.of(context).size.width * 0.75,
                                e.data(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: 8.0,
                      ),
                      child: SizedBox(
                        height: 58.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            ...[
                              "Yayla turizmi",
                              "Kış turizmi",
                              "Sağlık turizmi",
                              "Dağ turizmi"
                            ].mapIndexed(
                              (buttonText, i) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: i > 0 ? 16.0 : 0.0,
                                  ),
                                  child: roundedButton(
                                    context,
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppColors.blue,
                                    textColor: Colors.black,
                                    elevation: 4.0,
                                    buttonText: buttonText,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    onPressed: () {},
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
