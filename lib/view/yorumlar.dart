import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ekotel/constants/theme.dart';

class YorumlarSayfasi extends StatefulWidget {
  const YorumlarSayfasi({Key? key}) : super(key: key);

  @override
  State<YorumlarSayfasi> createState() => _YorumlarSayfasiState();
}

class _YorumlarSayfasiState extends State<YorumlarSayfasi> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(414, 896),
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Image.asset(
                'assets/resimler/dalga.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 45.h,
            left: 5.w,
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: InkWell(
                onTap: () {
                  // Geri dönme işlemi burada gerçekleştirilecek
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 100.h, 10.w, 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 40.h, 10.w, 10.h),
                  child: Text(
                    'Sunyata Eco',
                    style: TextStyle(
                      fontSize: 60.sp,
                      color: AppColors.anaRenk,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(110.w, 0, 10.w, 5.h),
                  child: Text(
                    'Hotel',
                    style: TextStyle(
                      fontSize: 60.sp,
                      color: AppColors.anaRenk,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.w, 0, 10.w, 12.h),
                  child: Text(
                    'Yorumlar',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ),
                Container(
                  height: 425.h,
                  width: 375.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: AppColors.koyuMavi,
                        thickness: 2.0,
                        indent: 22.0.w,
                        endIndent: 22.0.w,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const YorumWidget(
                        kullaniciAdi: 'Ahmet Özerk',
                        tarih: '20 Haziran 2023',
                        yildiz: 4,
                        yorum:
                            'Doğa içinde dinlenip sakin bir tatil geçirmek için eşsiz bir ortama sahip!',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: 390.w,
        height: 72.h,
        decoration: BoxDecoration(
          color: AppColors.anaRenk,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () => _onItemTapped(0),
              child: Icon(
                Icons.home,
                size: 41.sp,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(1),
              child: Icon(
                Icons.search,
                size: 41.sp,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(2),
              child: Icon(
                Icons.person,
                size: 41.sp,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(3),
              child: Icon(
                Icons.notifications,
                size: 41.sp,
                color: _selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YorumWidget extends StatelessWidget {
  final String kullaniciAdi;
  final String tarih;
  final int yildiz;
  final String yorum;

  const YorumWidget({
    super.key,
    required this.kullaniciAdi,
    required this.tarih,
    required this.yildiz,
    required this.yorum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              kullaniciAdi,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto Condensed',
                              ),
                            ),
                            Text(
                              tarih,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Roboto Condensed',
                                fontWeight: FontWeight.bold,
                                color: AppColors.anaRenk,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: 18.h),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      return Icon(
                        Icons.star,
                        size: 20.sp,
                        color: index < yildiz
                            ? AppColors.toplamYildiz
                            : Colors.grey,
                      );
                    },
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  yorum,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Roboto Condensed',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
