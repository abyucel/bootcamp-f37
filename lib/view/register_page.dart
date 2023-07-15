import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../common/user.dart';
import '../main.dart';
import '../util.dart';

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
    var result = await authService.register(_emailCtl.text, _passwordCtl.text);
    if (result.isErr) {
      setState(() {
        _passwordCtl.text = "";
        isEnabled = true;
      });
      return;
    }
    final user = authService.auth.currentUser!;
    final userData = UserData(
      id: user.uid,
      firstName: _firstNameCtl.text,
      lastName: _lastNameCtl.text,
      email: _emailCtl.text,
      createdAt: DateTime.now(),
    );
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set(userData.toMap());
    } catch (e) {
      print("Failed to register correctly. The user doesn't have any data now");
      setState(() {
        _passwordCtl.text = "";
        isEnabled = true;
      });
      return;
    }
    result = await authService.login(_emailCtl.text, _passwordCtl.text);
    if (result.isErr) {
      print("Failed to login after a successful register.");
      setState(() {
        _passwordCtl.text = "";
        isEnabled = true;
      });
      return;
    }
    if (context.mounted) {
      navigate(
        context,
        const TestPage("MainPage"),
        replace: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
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
                ),
                const SizedBox(height: 16.0),
                customTextField(
                  controller: _lastNameCtl,
                  enabled: isEnabled,
                  hintText: "Soyad",
                ),
                const SizedBox(height: 16.0),
                customTextField(
                  controller: _emailCtl,
                  enabled: isEnabled,
                  hintText: "E-posta",
                ),
                const SizedBox(height: 16.0),
                customTextField(
                  controller: _passwordCtl,
                  enabled: isEnabled,
                  hintText: "Şifre",
                  obscureText: true,
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
    );
  }
}
