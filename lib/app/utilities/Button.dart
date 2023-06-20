import 'package:flutter/material.dart';

Widget DynamicButton(
  double Height,
  double R,
  double L,
  Color C,
  String Txt,
  double Fontsize,
  double Rad,
) {
  // R,L,B,T - Renk - Text - TextSize - Radius - Shadow
  return GestureDetector(
    onTap: () => print("Basıldı"),
    child: Container(
      margin: EdgeInsets.fromLTRB(L, 0, R, 0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 4)),
      ], borderRadius: BorderRadius.circular(Rad), color: C),
      // R,L,B,T - Renk - Text - TextSize - Radius - Shadow
      child: Center(
        child: Text(
          Txt,
          style: TextStyle(color: Colors.white, fontSize: Fontsize),
        ),
      ),
      width: double.infinity,
      height: Height,
    ),
  );
}
