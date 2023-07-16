import 'package:flutter/material.dart';

import '../main.dart';
import '../util.dart';
import 'main_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  bool isEnabled = true;

  Future<void> login() async {
    setState(() {
      isEnabled = false;
    });
    final email = _emailCtl.text.trim();
    final password = _passwordCtl.text.trim();
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        isEnabled = true;
      });
      notifySnackbar(context, "Lütfen bütün alanları doldurun.");
      return;
    }
    final result = await authService.login(_emailCtl.text, _passwordCtl.text);
    if (result.isErr) {
      setState(() {
        _passwordCtl.text = "";
        isEnabled = true;
      });
      if (context.mounted) notifySnackbar(context, result.unwrapErr());
      return;
    }
    if (context.mounted) {
      navigate(
        context,
        const MainPage(),
        replace: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(top: 16.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          "Hesabınıza giriş yapın",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      customTextField(
                        controller: _emailCtl,
                        enabled: isEnabled,
                        hintText: "E-posta",
                        icon: Icons.email,
                      ),
                      customTextField(
                        controller: _passwordCtl,
                        enabled: isEnabled,
                        hintText: "Şifre",
                        icon: Icons.key,
                        obscureText: true,
                      ),
                      roundedTextButton(
                        context,
                        onPressed: null,
                        buttonText: "Şifreni mi unuttun?",
                        textColor: Colors.white,
                        foregroundColor: Colors.white,
                      ),
                      roundedButton(
                        context,
                        onPressed: login,
                        buttonText: "Giriş yap",
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        textColor: Colors.black,
                      ),
                      roundedTextButton(
                        context,
                        onPressed: () {
                          navigateWithSlide(
                            context,
                            const RegisterPage(),
                            SlideDirection.down,
                            replace: true,
                          );
                        },
                        buttonText: "Hesabın yok mu? Kayıt ol!",
                        textColor: Colors.white,
                        foregroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
