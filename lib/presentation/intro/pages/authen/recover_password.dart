import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class RecoveryPasswordPage extends StatelessWidget {
  RecoveryPasswordPage({Key? key}) : super(key: key);

  //s2
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  //s3

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recovery your Password"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "To recover your password, please follow the steps below.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Or if you require assistance, contact us by telegram/antiSCM or our online Livechat.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                // Step 1: Verify your identity
                _buildExpandablePanel(
                  title: "Step 1: Verify your identity",
                  isCompleted: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Please choose how we will send a code to verify your identity:",
                      ),
                      const SizedBox(height: 8),
                      RadioListTile(
                        title: const Text(
                            "Text code to my telephone number ending in **** 1894"),
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      RadioListTile(
                        title: const Text(
                            "Send the code to my email address ending in ****@***myst.co.uk"),
                        value: 2,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Your password has been reset successfully."),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Button(
                                  onPressed: () =>
                                      Routes.navigateToPage(context, Login()),
                                  text: 'Gửi mã code',
                                  backgroundColor: Colors.black,
                                  buttonSize: Size(328, 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Step 2: Enter verification code
                _buildExpandablePanel(
                  title: "Step 2: Enter verification code",
                  isCompleted: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Please enter the digit code sent to your mail:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: TextField(
                              controller: _controllers[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            onPressed: () =>
                                Routes.navigateToPage(context, Login()),
                            text: 'Nhập mã xác minh',
                            backgroundColor: Colors.black,
                            buttonSize: Size(328, 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          print('Send another code pressed');
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Gửi lại mã'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                // Step 3: Set your new PIN code
                _buildExpandablePanel(
                  title: "Step 3: Set your new PIN code",
                  isCompleted: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft, // Căn lề trái
                        child: const Text(
                          'Please your digit PIN code below:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: TextField(
                              controller: _controllers[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft, // Căn lề trái
                        child: const Text(
                          'Please confirm your digit PIN code below:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: TextField(
                              controller: _controllers[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            onPressed: () =>
                                Routes.navigateToPage(context, Login()),
                            text: 'Xác nhận mã pin mới',
                            backgroundColor: Colors.black,
                            buttonSize: Size(328, 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Step 4: Confirmation
                _buildExpandablePanel(
                  title: "Step 4: Confirmation",
                  isCompleted: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Your password has been reset successfully."),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            onPressed: () =>
                                Routes.navigateToPage(context, Login()),
                            text: 'Đăng nhập',
                            backgroundColor: Colors.black,
                            buttonSize: Size(328, 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildExpandablePanel({
    required String title,
    required Widget child,
    required bool isCompleted,
  }) {
    return ExpandablePanel(
      header: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (isCompleted)
            const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
        ],
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: child,
      ),
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapBodyToExpand: true,
        tapBodyToCollapse: true,
        hasIcon: true,
      ),
    );
  }
}
