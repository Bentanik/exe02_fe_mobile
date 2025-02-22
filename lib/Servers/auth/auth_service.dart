import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//
// class AuthService {
//   Future<void> signup({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       String message = '';
//       if (e.code == 'weak-password') {
//         message = 'Mật khẩu bạn cung cấp quá yếu.';
//       } else if (e.code == 'email-already-in-use') {
//         message = 'Email này đã tồn tại ! Vui lòng nhập email khác.';
//       }
//       Fluttertoast.showToast(msg: message,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.TOP,
//         backgroundColor:  Colors.black,
//         textColor:  Colors.white,
//         fontSize: 14,
//       );
//     }
//     catch(e){
//
//     }
//   }
// }

Future<void> signup({
  required String email,
  required String password,
  // required String confirmPassword,
}) async {
  if (email.isEmpty || password.isEmpty) {
    Fluttertoast.showToast(msg: "Vui lòng điền đầy đủ thông tin.");
    return;
  }

  // if (password != confirmPassword) {
  //   Fluttertoast.showToast(msg: "Mật khẩu xác nhận không khớp.");
  //   return;
  // }

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    Fluttertoast.showToast(msg: "Đăng ký thành công!");
  } on FirebaseAuthException catch (e) {
    String message = '';
    if (e.code == 'weak-password') {
      message = 'Mật khẩu quá yếu.';
    } else if (e.code == 'email-already-in-use') {
      message = 'Email đã tồn tại!';
    } else {
      message = 'Đăng ký thất bại, thử lại sau.';
    }
    Fluttertoast.showToast(msg: message);
  } catch (e) {
    var result = Fluttertoast.showToast(msg: "Lỗi không xác định: ${e.toString()}");
    print(result);
  }
}
