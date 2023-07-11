import 'package:ekotel/app/constants/theme.dart';
import 'package:flutter/material.dart';

class OtelProfile extends StatelessWidget {
  const OtelProfile({super.key});
  @override
  Widget build(BuildContext context) {
    double fotosize = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: fotosize,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/resimler/oteliç2.png"),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: fotosize - 30,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: AppColors.anaRenk,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                        child: Row(
                          children: [
                            Text(
                              "LaVista Otel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "RobotoBOLD",
                                  fontSize: 40),
                            ),
                            Spacer(),
                            Icon(
                              Icons.phone_in_talk,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.toplamYildiz,
                              size: 33,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.toplamYildiz,
                              size: 33,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.toplamYildiz,
                              size: 33,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.toplamYildiz,
                              size: 33,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 241, 185, 16)),
                              child: Text(
                                "5 Yıldız",
                                style: TextStyle(
                                    fontFamily: "RobotoRegular",
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 30, 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                print("Yorumlar Butonuna Basıldı");
                              },
                              child: Text(
                                "39 Yorum",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "RobotoRegular",
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 30, 15),
                        child: Text(
                          "Bu mütevazı otel Adana Etnografya Müzesine 2 dakika, 16. yüzyıldan kalma Ulu Cami'ye 14 dakika yürüme mesafesinde ve Seyhan Nehri'ne 1 km mesafededir.",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "RobotoRegular",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.recycling_rounded,
                                            color: AppColors.anaRenk,
                                            size: 40,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Çevre Dostu",
                                            style: TextStyle(
                                                fontFamily: "RobotoRegular",
                                                fontSize: 22,
                                                color: AppColors.anaRenk),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.lock_outlined,
                                            color: AppColors.anaRenk,
                                            size: 40,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Güvenli",
                                            style: TextStyle(
                                                fontFamily: "RobotoRegular",
                                                fontSize: 22,
                                                color: AppColors.anaRenk),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.no_drinks_rounded,
                                            color: AppColors.anaRenk,
                                            size: 40,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Sınırlı",
                                            style: TextStyle(
                                                fontFamily: "RobotoRegular",
                                                fontSize: 22,
                                                color: AppColors.anaRenk),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.nature_people_outlined,
                                            color: AppColors.anaRenk,
                                            size: 40,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Doğa İçinde",
                                            style: TextStyle(
                                                fontFamily: "RobotoRegular",
                                                fontSize: 22,
                                                color: AppColors.anaRenk),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                child: Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: AppColors.anaRenk),
                                      onPressed: () {
                                        print("Rezerve Et Butonuna Basıldı");
                                      },
                                      child: Text(
                                        "REZERVE ET",
                                        style: TextStyle(
                                            fontFamily: "RobotoNormal",
                                            fontSize: 20),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
