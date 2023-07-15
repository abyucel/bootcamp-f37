import 'package:firebase_auth/firebase_auth.dart';

import '../common/result.dart';

class AuthService {
  final FirebaseAuth auth;
  Stream<User?> get authStateChangeStream => auth.authStateChanges();

  AuthService(this.auth);

  Future<Result<(), String>> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Ok(());
    } on FirebaseAuthException catch (e) {
      return Err(switch (e.message) {
        'invalid-email' => 'Lütfen e-posta adresinizi kontrol edin.',
        'user-disabled' => 'Bu üyelik kapatılmış. Bize ulaşın.',
        'user-not-found' => 'Böyle bir üyelik bulunamadı.',
        'wrong-password' => 'Lütfen şifrenizi kontrol edin.',
        _ => e.toString(),
      });
    }
  }

  Future<Result<(), String>> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Ok(());
    } on FirebaseAuthException catch (e) {
      return Err(switch (e.message) {
        'email-already-in-use' => 'Bu e-posta adresi kullanılmış.',
        'invalid-email' => 'Lütfen e-posta adresinizi kontrol edin.',
        'operation-not-allowed' => 'Kayıt olma özelliği kapatılmış.',
        'weak-password' => 'Şifreniz 6 karakterden uzun olmalıdır.',
        _ => e.toString(),
      });
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
