import 'package:flutter/material.dart';

import '../util.dart';
import 'login_page.dart';
import 'main_page.dart';
import 'register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              margin: const EdgeInsets.only(top: 16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              child: Image.asset("assets/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  roundedButton(
                    context,
                    onPressed: () {
                      navigateWithSlide(
                        context,
                        const LoginPage(),
                        SlideDirection.down,
                      );
                    },
                    buttonText: "Giriş yap",
                  ),
                  const SizedBox(height: 8),
                  roundedButton(
                    context,
                    onPressed: () {
                      navigateWithSlide(
                        context,
                        const RegisterPage(),
                        SlideDirection.down,
                      );
                    },
                    buttonText: "Kayıt ol",
                  ),
                  const SizedBox(height: 8),
                  roundedTextButton(
                    context,
                    onPressed: () {
                      navigateWithSlide(
                        context,
                        //const TestPage("MainPage"),
                        const MainPage(),
                        SlideDirection.down,
                      );
                    },
                    buttonText: "Misafir olarak devam et",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
