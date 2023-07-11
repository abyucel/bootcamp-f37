import 'package:ekotel/app/constants/theme.dart';
import 'package:flutter/material.dart';
import '../app/utilities/Button.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "One With Nature",
                    style: TextStyle(
                        color: AppColors.anaRenk,
                        fontSize: 40,
                        fontFamily: 'RobotoBOLDItalic'),
                  ),
                ]),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/resimler/reklam.png")),
                    ),
                  ),
                ),
                DynamicButton(43, 20, 20, AppColors.anaRenk,
                    "Hadi Bir Otel Ara...", 25, 9),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 0, 10),
                  child: Row(
                    children: [
                      Text("Oteller",
                          style: TextStyle(
                              color: AppColors.anaRenk,
                              fontSize: 30,
                              fontFamily: "RobotoRegular")),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset: Offset(0, -3)),
                        ]),
                    width: double.infinity,
                    child: ListView(
                      padding: EdgeInsets.all(17),
                      children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 15),
                                width: 150,
                                height: 190,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/resimler/otel.jpg"),
                                    )),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "La Vista Otel",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "RobotoRegular"),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Doğa ile \n iç içe asasdasdasda\nsdasdasdasdasdasdas",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: "RobotoLight"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Merkeze 1.2 KM",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "RobotoRegular"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
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
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        otelcagir(),
                        otelcagir(),
                        otelcagir(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

otelcagir() {
  return Container(
    width: double.infinity,
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 15),
          width: 150,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/resimler/otel.jpg"),
              )),
        ),
        Column(
          children: [
            Text(
              "La Vista Otel",
              style: TextStyle(fontSize: 25, fontFamily: "RobotoRegular"),
            ),
            SizedBox(height: 10),
            Text(
              "Doğa ile \n iç içe asasdasdasda\nsdasdasdasdasdasdas",
              style: TextStyle(fontSize: 19, fontFamily: "RobotoLight"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Merkeze 1.2 KM",
              style: TextStyle(fontSize: 20, fontFamily: "RobotoRegular"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
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
              ],
            )
          ],
        ),
      ],
    ),
  );
}
