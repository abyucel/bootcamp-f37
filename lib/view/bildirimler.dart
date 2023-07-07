import 'package:flutter/material.dart';
import '../app/constants/theme.dart';

class BildirimSayfasi extends StatefulWidget {
  const BildirimSayfasi({super.key});

  @override
  State<BildirimSayfasi> createState() => _BildirimSayfasiState();
}

class _BildirimSayfasiState extends State<BildirimSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bildirimler,',
                      style: TextStyle(
                        fontFamily: 'RobotoRegular',
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Bugün 3 Yeni Bildirim',
                      style: TextStyle(
                        fontFamily: 'RobotoRegular',
                        fontSize: 16,
                        color: AppColors.aramaLogosu,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/resimler/kullanıcı.png'),
                  backgroundColor: AppColors.anaRenk,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/resimler/otel.jpg'),
                  backgroundColor: AppColors.anaRenk,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 150, top: 5),
                      child: Text(
                        "Miracle Eco Otel",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'RobotoBOLD'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Yeni sezona özel %10 indirim fırsatı',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'RobotoRegular'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 200, top: 5),
                      child: Text(
                        '23-01-2023',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'RobotoRegular'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              SizedBox(
                height: 80,
                width: 100,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/resimler/otel.jpg'),
                      backgroundColor: AppColors.anaRenk,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 25,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/resimler/kullanıcı.png'),
                      backgroundColor: AppColors.anaRenk,
                    ),
                  )
                ]),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 140, top: 5),
                    child: Text(
                      "Miracle Eco Otel",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'RobotoBOLD'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Yeni sezona özel %10 indirim fırsatı',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'RobotoRegular'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200, top: 5),
                    child: Text(
                      '23-01-2023',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'RobotoRegular'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
