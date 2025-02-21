import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/courses.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<Filters> {
  // Trạng thái của các bộ lọc
  Map<String, bool> subCategories = {
    "Cloud Security Basics": true,
    "Incident Response and Recovery": true,
    "Security Policies and Compliance": false,
    "Ethical Hacking and Penetration Testing": false,
    "Application Security": false,
  };

  Map<String, bool> levels = {
    "All Levels": false,
    "Beginners": true,
    "Intermediate": true,
    "Expert": false,
  };

  Map<String, bool> ratings = {
    "4.5 & Up Above": false,
    "4.0 & Up Above": false,
    "3.5 & Up Above": false,
    "3.0 & Up Above": false,
  };

  Map<String, bool> videoDurations = {
    "0-2 Hours": false,
    "3-6 Hours": false,
    "7-16 Hours": false,
    "17+ Hours": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Filter", style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // Reset tất cả bộ lọc
                subCategories.updateAll((key, value) => false);
                levels.updateAll((key, value) => false);
                ratings.updateAll((key, value) => false);
                videoDurations.updateAll((key, value) => false);
              });
            },
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSection("SubCategories", subCategories),
                _buildSection("Levels", levels),
                _buildSection("Rating", ratings),
                _buildSection("Video Durations", videoDurations),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                width: double.infinity,
                child: Button(
                    text: 'Lọc dữ liệu',
                    onPressed: () =>
                        Routes.navigateToPage(context, Courses()),
                    buttonSize: Size(double.infinity, 40),
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Map<String, bool> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: options.keys.map((key) {
            return CheckboxListTile(
              value: options[key],
              onChanged: (bool? value) {
                setState(() {
                  options[key] = value!;
                });
              },
              title: Text(key, style: const TextStyle(fontSize: 14)),
              activeColor: Colors.green,
              controlAffinity: ListTileControlAffinity.leading,
            );
          }).toList(),
        ),
      ],
    );
  }
}
