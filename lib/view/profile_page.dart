import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../main.dart';
import '../util.dart';
import 'main_page.dart';

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
      bottomNavigationBar: bottomNavbar(context, bottomBarPage),
      body: SafeArea(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            CustomPaint(
              painter: HeaderProfilePainter(color: AppColors.blue),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width / 8,
              ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(authService.auth.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final data = snapshot.data!;
                  return Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: MediaQuery.of(context).size.width / 4 + 4,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 4,
                            backgroundImage: const AssetImage(
                              "assets/placeholder.jpg",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Text(
                                "${data["first_name"]} ${data["last_name"]}",
                                style: const TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "${data["email"]}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              child: roundedTextButton(
                                context,
                                buttonText: "Çıkış yap",
                                textColor: AppColors.red,
                                foregroundColor: AppColors.red,
                                fontSize: 22.0,
                                onPressed: () async {
                                  await authService.logout();
                                  if (context.mounted) {
                                    navigate(
                                      context,
                                      const MainPage(),
                                      clearHistory: true,
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                              ),
                              child: Accordion(
                                maxOpenSections: 1,
                                headerBackgroundColorOpened: AppColors.blue,
                                headerBackgroundColor: Colors.white,
                                rightIcon: const Icon(Icons.chevron_right),
                                children: [
                                  AccordionSection(
                                    leftIcon: const Icon(Icons.eco),
                                    header: const Text(
                                      "Geçmiş tatiller",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    content: const Text(
                                      "TODO",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  AccordionSection(
                                    leftIcon: const Icon(Icons.person),
                                    header: const Text(
                                      "Kullanıcı bilgileri",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    content: const Text(
                                      "TODO",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  AccordionSection(
                                    leftIcon: const Icon(Icons.settings),
                                    header: const Text(
                                      "Ayarlar",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    content: const Text(
                                      "TODO",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  AccordionSection(
                                    leftIcon: const Icon(Icons.language),
                                    header: const Text(
                                      "Dil",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    content: const Text(
                                      "TODO",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
