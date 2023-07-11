import 'package:flutter/material.dart';
import '../app/constants/theme.dart';

class BildirimSayfasi extends StatelessWidget {
  const BildirimSayfasi({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: listView(),
    );
  }

  Widget listView() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Bildirimler,',
                    style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Bugün 3 Yeni Bildirim',
                    style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      fontSize: 16,
                      color: AppColors.aramaLogosu,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/resimler/kullanıcı.png'),
                backgroundColor: AppColors.anaRenk,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return listViewItem(index);
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 0);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  Widget listViewItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeandDate(index),
                  button(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/resimler/otel.jpg'),
            backgroundColor: AppColors.anaRenk,
          ),
        ],
      ),
    );
  }

  Widget message(int index) {
    double textSize = 14;
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: 'Miracle Eco Otel',
        style: TextStyle(
          fontSize: textSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: const [
          TextSpan(
            text: '   İlk tatilinize özel %10 indirim',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget timeandDate(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '23-01-2023',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            '07:10',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget button(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 280),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: () {},
      ),
    );
  }
}
