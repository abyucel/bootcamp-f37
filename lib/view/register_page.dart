import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../common/user.dart';
import '../main.dart';
import '../util.dart';
import 'main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstNameCtl = TextEditingController();
  final _lastNameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  bool isEnabled = true;

  Future<void> register() async {
    setState(() {
      isEnabled = false;
    });
    final firstName = _firstNameCtl.text.trim();
    final lastName = _lastNameCtl.text.trim();
    final email = _emailCtl.text.trim();
    final password = _emailCtl.text.trim();
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      setState(() {
        isEnabled = true;
      });
      notifySnackbar(context, "Lütfen bütün alanları doldurun.");
      return;
    }
    var result = await authService.register(email, password);
    if (result.isErr) {
      setState(() {
        _passwordCtl.text = "";
        isEnabled = true;
      });
      if (context.mounted) notifySnackbar(context, result.unwrapErr());

      return;
    }
    final user = authService.auth.currentUser!;
    final userData = UserData(
      id: user.uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
      createdAt: DateTime.now(),
    );
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set(userData.toMap());
    } catch (e) {
      setState(() {
        _passwordCtl.text = "";
        isEnabled = true;
      });
      if (context.mounted) {
        notifySnackbar(context, "Veri kaydı hatası. Bize ulaşın.");
      }
      return;
    }
    result = await authService.login(email, password);
    if (result.isErr) {
      setState(() {
        _passwordCtl.text = "";
        isEnabled = true;
      });
      if (context.mounted) {
        notifySnackbar(context, "Kayıttan sonra giriş başarısız.");
      }
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
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            CustomPaint(
              painter: HeaderWavePainter(color: Colors.blue),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  customTextField(
                    controller: _firstNameCtl,
                    enabled: isEnabled,
                    hintText: "Ad",
                    icon: Icons.text_fields,
                  ),
                  const SizedBox(height: 16.0),
                  customTextField(
                    controller: _lastNameCtl,
                    enabled: isEnabled,
                    hintText: "Soyad",
                    icon: Icons.text_fields,
                  ),
                  const SizedBox(height: 16.0),
                  customTextField(
                    controller: _emailCtl,
                    enabled: isEnabled,
                    hintText: "E-posta",
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 16.0),
                  customTextField(
                    controller: _passwordCtl,
                    enabled: isEnabled,
                    hintText: "Şifre",
                    obscureText: true,
                    icon: Icons.key,
                  ),
                  const SizedBox(height: 16.0),
                  roundedButton(
                    context,
                    onPressed: register,
                    buttonText: "Kayıt ol",
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
