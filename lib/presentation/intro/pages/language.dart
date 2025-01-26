import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F1FF), // Nền xanh
              borderRadius: BorderRadius.circular(20), // Bo góc 15px
            ),
            child: Column(
              children: [
                _buildLanguageItem(
                  title: "English",
                  subtitle: "iPhone Language",
                  isPrimary: true,
                ),
                const Divider(color: Colors.grey),
                _buildLanguageItem(
                  title: "Tiếng Việt",
                  subtitle: "Vietnamese",
                  isPrimary: false,
                ),
                const Divider(color: Colors.grey),
                ListTile(
                  title: const Text(
                    "Add Language...",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    // Add functionality to add a language
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageItem({
    required String title,
    required String subtitle,
    required bool isPrimary,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[700], fontSize: 14),
      ),
      trailing: isPrimary
          ? const Icon(Icons.drag_handle, color: Colors.black)
          : const Icon(Icons.drag_handle, color: Colors.black),
      onTap: () {
        // Handle language selection
      },
    );
  }
}
