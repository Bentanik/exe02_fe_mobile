// import 'package:dio/dio.dart';
// import 'package:exe02_fe_mobile/Servers/api.dart';
// import 'package:exe02_fe_mobile/Servers/auth/login_api.dart';
// import 'package:exe02_fe_mobile/common/helpers/routes.dart';
// import 'package:exe02_fe_mobile/common/widget/ErrorDialog.dart';
// import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class LoginController {
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final BuildContext context;
//   bool isLoading = false;
//   String? errorMessage;
//   final Function(bool, {String? avatarUrl}) updateLoginState;
//
//   LoginController({
//     required this.emailController,
//     required this.passwordController,
//     required this.context,
//     required this.updateLoginState,
//   });
//
//   Future<void> login(VoidCallback onLoading, VoidCallback onDone) async {
//     onLoading();
//
//     try {
//       await LoginApi(Api()).login(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//
//       if (context.mounted) {
//
//         // updateLoginState(true);
//         // Hiển thị thông báo thành công
//         Fluttertoast.showToast(
//           msg: "Đăng nhập thành công!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.TOP,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//
//         // Chuyển sang trang Home sau 1 giây
//         Future.delayed(Duration(seconds: 1), () {
//           Routes.navigateToPage(context, Home());
//         });
//       }
//     } catch (error) {
//       String? errorMessage;
//
//       if (error is DioException) {
//         final responseData = error.response?.data;
//
//         if (responseData is Map<String, dynamic>) {
//           if (responseData.containsKey('errors') &&
//               responseData['errors'] is List &&
//               responseData['errors'].isNotEmpty) {
//             errorMessage = responseData['errors'][0]['message'];
//           } else if (responseData.containsKey('detail')) {
//             errorMessage = responseData['detail'];
//           }
//         }
//       }
//       _showErrorDialog(errorMessage ?? 'Có lỗi xảy ra, hãy thử lại');
//     } finally {
//       onDone();
//     }
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => ErrorDialog(
//         message: message,
//         onRetry: () => login(() {}, () {}),
//       ),
//     );
//   }
// }