import 'package:ekotel/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<double> ratingList = [5, 4, 4.5, 3];
List<double> newList = [4, 4.5, 3.5, 5];

class _SearchPageState extends State<SearchPage> {
  int selectedButtonIndex = 0;
  int buttonIndex = 0;
  bool _isPopupVisible = false;

  void togglePopupVisibility() {
    setState(() {
      _isPopupVisible = !_isPopupVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Merhaba Ahmet,',
                        style: TextStyle(
                          fontFamily: 'RobotoRegular',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Hadi En Ecoteli Ara',
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
                    backgroundImage:
                        AssetImage('assets/resimler/kullanıcı.png'),
                    backgroundColor: AppColors.anaRenk,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 20, 12),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '   Otel Ara',
                          hintStyle: const TextStyle(
                              fontSize: 18, fontFamily: 'RobotoRegular'),
                          prefixIcon: const Icon(
                            CupertinoIcons.search_circle_fill,
                            size: 30,
                            color: AppColors.anaRenk,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: AppColors.anaRenk,
                              width: 3.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: AppColors.anaRenk,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        showPopup(context);
                      },
                      icon: const Icon(CupertinoIcons.list_bullet),
                      iconSize: 35,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 5, top: 20, bottom: 10, right: 230),
              child: Text(
                'Popüler Ecoteller',
                style: TextStyle(
                  fontFamily: 'RobotoRegular',
                  fontSize: 22,
                  color: AppColors.siyah,
                ),
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ratingList.length,
                itemBuilder: (BuildContext context, int index) {
                  String buttonText = '';
                  double rating = ratingList[index];
                  double newrating = newList[index];
                  switch (index) {
                    case 0:
                      buttonText = 'Miracle Eco Otel';
                      break;
                    case 1:
                      buttonText = 'Seaside Eco Otel';
                      break;
                    case 2:
                      buttonText = 'Star Eco Otel';
                      break;
                    case 3:
                      buttonText = 'Skyfall Eco Otel';
                      break;
                    default:
                      buttonText = 'Butterfly Eco Otel';
                  }
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(1.9, 1.9, 15.0, 1.9),
                    child: Container(
                      width: 230,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            offset: Offset(2, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.koyuGri,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/resimler/otel.jpg',
                                fit: BoxFit.cover,
                                width: 230,
                                height: 180,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 22,
                            left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  buttonText,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'RobotoRegular',
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(
                                        CupertinoIcons.arrow_3_trianglepath,
                                        color: AppColors.agacLogo),
                                    const SizedBox(width: 5),
                                    Text(
                                      '$newrating/5',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.agacLogo,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    const Icon(
                                      CupertinoIcons.star_fill,
                                      color: AppColors.yildizFont,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '$rating/5',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                minimumSize: const Size(230, 180),
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 55,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Öğe sayısı
                  itemBuilder: (BuildContext context, int index) {
                    String buttonText = '';
                    switch (index) {
                      case 0:
                        buttonText = 'Yayla Turizmi';
                        break;
                      case 1:
                        buttonText = 'Kıyı turizmi';
                        break;
                      case 2:
                        buttonText = 'Sağlık Turizmi';
                        break;
                    }
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = index;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedButtonIndex == index
                                ? AppColors.anaRenk
                                : AppColors.koyuGri,
                            minimumSize: const Size(120, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            buttonText,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'RobotoRegular',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 6,
            ),
            selectedButtonIndex == 0
                ? SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Visibility(
                          visible: selectedButtonIndex == 0,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: SizedBox(
                              width: 160,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/resimler/otel.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    minimumSize: const Size(120, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(60, 90, 0, 0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 6),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Detay ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'RobotoRegular',
                                                ),
                                              ),
                                              Icon(
                                                  CupertinoIcons
                                                      .greaterthan_circle,
                                                  size: 15,
                                                  color: Colors.white),
                                            ],
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : selectedButtonIndex == 1
                    ? SizedBox(
                        height: 130,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4, // Öğe sayısı
                          itemBuilder: (BuildContext context, int index) {
                            return Visibility(
                              visible: selectedButtonIndex == 1,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: SizedBox(
                                  width: 160,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/resimler/kiyi.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        minimumSize: const Size(120, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(60, 90, 0, 0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Detay ',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'RobotoRegular',
                                                    ),
                                                  ),
                                                  Icon(
                                                      CupertinoIcons
                                                          .greaterthan_circle,
                                                      size: 15,
                                                      color: Colors.white),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : selectedButtonIndex == 2
                        ? SizedBox(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4, // Öğe sayısı
                              itemBuilder: (BuildContext context, int index) {
                                return Visibility(
                                  visible: selectedButtonIndex == 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: SizedBox(
                                      width: 160,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/resimler/oteliç.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            minimumSize: const Size(120, 60),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                60, 90, 0, 0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 6),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        'Detay ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'RobotoRegular',
                                                        ),
                                                      ),
                                                      Icon(
                                                          CupertinoIcons
                                                              .greaterthan_circle,
                                                          size: 15,
                                                          color: Colors.white),
                                                    ],
                                                  ),
                                                ]),
                                          ), // İçerik olmadığı için boş SizedBox ekledik
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(),
          ],
        ),
      ),
    );
  }

  void showPopup(BuildContext context) {
    double minValue = 3000;
    double maxValue = 30000;
    String? odaSayisi;
    String? ecoOrani;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.0),
                ),
              ),
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                    width: 20,
                  ),
                  const Text(
                    'Fiyat Aralığı:',
                    style: TextStyle(
                      fontFamily: 'RobotoBOLD',
                      color: AppColors.anaRenk,
                      fontSize: 25.0,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Min: ${minValue.toStringAsFixed(2)}'),
                      Text('Max: ${maxValue.toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  RangeSlider(
                    min: 3000,
                    max: 30000,
                    divisions: 10,
                    values: RangeValues(minValue, maxValue),
                    onChanged: (values) {
                      setState(() {
                        minValue = values.start;
                        maxValue = values.end;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Odalar:',
                    style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      color: AppColors.anaRenk,
                      fontSize: 25.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.house_fill,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Oda Sayısı',
                        style: TextStyle(
                          fontFamily: 'RobotoRegular',
                          color: AppColors.siyah,
                          fontSize: 20.0,
                        ),
                      ),
                      const Spacer(),
                      DropdownButton(
                        dropdownColor: AppColors.koyuGri,
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        value: odaSayisi,
                        items: ["1", "2", "3", "4", "5", "6"]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            odaSayisi = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_3_trianglepath,
                        color: AppColors.agacLogo,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Eco oranı',
                        style: TextStyle(
                          fontFamily: 'RobotoRegular',
                          color: AppColors.siyah,
                          fontSize: 20.0,
                        ),
                      ),
                      const Spacer(),
                      DropdownButton(
                        dropdownColor: AppColors.koyuGri,
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        value: ecoOrani,
                        items:
                            ["1.0 - 2.0", "2.0 - 3.0", "3.0 - 4.0", "4.0 - 5.0"]
                                .map((label) => DropdownMenuItem(
                                      child: Text(label),
                                      value: label,
                                    ))
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            ecoOrani = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Filtreyi Uygula'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
