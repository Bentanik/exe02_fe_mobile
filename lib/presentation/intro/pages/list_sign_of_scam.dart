import 'package:flutter/material.dart';

class ScamSignsList extends StatelessWidget {
  final List<Map<String, String>> scamArticles = [
    {
      'title': 'Social Engineering',
      'description':
      'Cybercriminals manipulate or trick individuals into revealing confidential information by pretending to be someone trustworthy, such as a colleague, customer support, or auth.....',
      'tagColor': '0xFFFFF3D0', // Light yellow
    },
    {
      'title': 'Social Engineering',
      'description':
      'Cybercriminals manipulate or trick individuals into revealing confidential information by pretending to be someone trustworthy, such as a colleague, customer support, or auth.....',
      'tagColor': '0xFFFFE4E6', // Light pink
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Signs of Scam',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: scamArticles.length,
        itemBuilder: (context, index) {
          final article = scamArticles[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(int.parse(article['tagColor']!)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      article['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Description
                  Text(
                    article['description']!,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
