import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: Text(
            widget.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(widget.text),
        ),

        TextButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa
            children: [
              Icon(_isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1, size: 16),
            ],
          ),
        ),

      ],
    );
  }
}