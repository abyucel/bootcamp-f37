import 'package:flutter/material.dart';

import 'main.dart';
import 'view/auth_page.dart';
import 'view/main_page.dart';
import 'view/profile_page.dart';
import 'view/search_page.dart';

enum SlideDirection { left, right, up, down }

extension OffsetExtension on SlideDirection {
  Offset get offset {
    switch (this) {
      case SlideDirection.left:
        return const Offset(1.0, 0.0);
      case SlideDirection.right:
        return const Offset(-1.0, 0.0);
      case SlideDirection.up:
        return const Offset(0.0, 1.0);
      case SlideDirection.down:
        return const Offset(0.0, -1.0);
    }
  }
}

void navigateWithSlide(
  BuildContext context,
  Widget page,
  SlideDirection direction, {
  bool replace = false,
  bool clearHistory = false,
}) {
  if (clearHistory) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (cx, a1, a2) => page,
        transitionsBuilder: (cx, a1, a2, cd) {
          var begin = direction.offset;
          const end = Offset.zero;
          const cv = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: cv));
          return SlideTransition(
            position: a1.drive(tween),
            child: cd,
          );
        },
      ),
      (route) => false,
    );
    return;
  }
  Function method = Navigator.push;
  if (replace) method = Navigator.pushReplacement;
  method(
    context,
    PageRouteBuilder(
      pageBuilder: (cx, a1, a2) => page,
      transitionsBuilder: (cx, a1, a2, cd) {
        var begin = direction.offset;
        const end = Offset.zero;
        const cv = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: cv));
        return SlideTransition(
          position: a1.drive(tween),
          child: cd,
        );
      },
    ),
  );
}

void navigate(
  BuildContext context,
  Widget page, {
  bool replace = false,
  bool clearHistory = false,
}) {
  if (clearHistory) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
    return;
  }
  Function method = Navigator.push;
  if (replace) method = Navigator.pushReplacement;
  method(context, MaterialPageRoute(builder: (context) => page));
}

class HeaderWavePainter extends CustomPainter {
  HeaderWavePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path = Path()
      ..relativeLineTo(0, size.height / 8)
      ..quadraticBezierTo(
        size.width / 8,
        size.height / 4,
        size.width / 2,
        size.height / 8,
      )
      ..quadraticBezierTo(
        3.5 * size.width / 4,
        size.height / 4,
        size.width,
        size.height / 8,
      )
      ..relativeLineTo(0, -size.height / 8)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HeaderProfilePainter extends CustomPainter {
  HeaderProfilePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path = Path()
      ..relativeLineTo(0, size.height / 4)
      ..quadraticBezierTo(
        size.width / 2,
        size.height / 2,
        size.width,
        size.height / 4,
      )
      ..relativeLineTo(0, -size.height / 4)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

ElevatedButton roundedButton(
  BuildContext context, {
  void Function()? onPressed,
  required String buttonText,
  Color backgroundColor = Colors.blueAccent,
  Color foregroundColor = Colors.white,
  Color textColor = Colors.white,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(double.infinity, 48.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    ),
    child: Text(
      buttonText,
      style: TextStyle(
        color: textColor,
        fontSize: 20.0,
      ),
    ),
  );
}

TextButton roundedTextButton(
  BuildContext context, {
  void Function()? onPressed,
  required String buttonText,
  Color foregroundColor = Colors.blue,
  Color textColor = Colors.grey,
  double fontSize = 16.0,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      fixedSize: const Size(double.infinity, 48.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      foregroundColor: foregroundColor,
    ),
    child: Text(
      buttonText,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    ),
  );
}

TextField customTextField({
  required TextEditingController controller,
  required String hintText,
  bool enabled = true,
  bool obscureText = false,
  bool filled = true,
  Color fillColor = Colors.white,
  Color textColor = Colors.black,
  Color enabledBorderColor = Colors.grey,
  Color disabledBorderColor = const Color.fromARGB(255, 64, 64, 64),
  Color focusedBorderColor = Colors.blue,
  IconData icon = Icons.error,
}) {
  return TextField(
    enabled: enabled,
    controller: controller,
    obscureText: obscureText,
    style: TextStyle(
      fontSize: 16.0,
      color: textColor,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      hintText: hintText,
      filled: filled,
      fillColor: fillColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: enabledBorderColor,
        ),
        borderRadius: BorderRadius.circular(32.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: disabledBorderColor,
        ),
        borderRadius: BorderRadius.circular(32.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: focusedBorderColor,
        ),
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
}

Widget ratingBar(
  int rating, {
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: List.generate(
      rating < 1 || rating > 5 ? 5 : rating,
      (i) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    ),
  );
}

void notifySnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

BottomNavigationBar bottomNavbar(BuildContext context, int bottomBarPage) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.blueAccent,
    unselectedItemColor: Colors.white,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 32),
        label: "Ana sayfa",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search, size: 32),
        label: "Arama",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 32),
        label: "Profil",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, size: 32),
        label: "Bildirimler",
      ),
    ],
    currentIndex: bottomBarPage,
    selectedItemColor: Colors.amber,
    onTap: (i) {
      if (i == bottomBarPage) return;
      final routes = [
        const MainPage(),
        const SearchPage(),
        const ProfilePage(),
        const TestPage("NotificationPage"),
      ];
      if (i == 3) {
        notifySnackbar(context, "Bu özellik henüz eklenmedi.");
        return;
      }
      if (i > 1 && authService.auth.currentUser == null) {
        navigateWithSlide(
          context,
          const AuthPage(),
          SlideDirection.up,
          clearHistory: true,
        );
        return;
      }
      navigateWithSlide(
        context,
        routes[i],
        SlideDirection.up,
        replace: true,
      );
    },
  );
}

class TestPage extends StatelessWidget {
  const TestPage(this.message, {Key? key}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(message ?? "TestPage");
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text(
            message ?? "TestPage",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
