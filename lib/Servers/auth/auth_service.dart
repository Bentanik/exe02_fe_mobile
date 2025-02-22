import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/Servers/auth/login_api.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/categories.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Api api = Api();
class AuthService {
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Đăng ký thành công, chuyển sang Home...");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code}");
      String message = '';
      if (e.code == 'weak-password') {
        message = 'Mật khẩu bạn cung cấp quá yếu.';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email này đã tồn tại! Vui lòng nhập email khác.';
      } else {
        message = 'Đăng ký thất bại! Vui lòng thử lại.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14,
      );
    } catch (e) {
      print("Signup Exception: $e");
    }
  }


  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String? idToken = await userCredential.user?.getIdToken();
      if (idToken != null) {
        // Gọi API backend với idToken
        await LoginApi(api).login(idTokenFirebase: idToken);
        // Chuyển hướng người dùng sau khi đăng nhập thành công
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Categories()));
      } else {
        // Xử lý trường hợp không lấy được idToken
        Fluttertoast.showToast(
          msg: 'Không thể lấy mã xác thực. Vui lòng thử lại.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14,
        );
      }
    } on FirebaseAuthException catch (e) {
      // Xử lý lỗi đăng nhập
      print("Firebase Auth Error: ${e.code}");
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'Tài khoản email này không tồn tại';
      } else if (e.code == 'wrong-password') {
        message = 'Sai mật khẩu! Vui lòng nhập lại';
      } else {
        message = 'Đăng nhập thất bại! Vui lòng thử lại.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14,
      );
    } catch (e, stackTrace) {
      print("Exception at Login: $e");
      print("StackTrace: $stackTrace");
    }
  }
}
