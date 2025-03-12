// common/helper/navigation_helper.dart
import 'package:flutter/material.dart';

class Routes {
  static Future<void> navigateToPage(BuildContext context, Widget page) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
