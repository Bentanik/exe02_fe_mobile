import 'package:flutter/material.dart';

class SecurityCard extends StatefulWidget {
  @override
  _FaceIDScreenState createState() => _FaceIDScreenState();
}

class _FaceIDScreenState extends State<SecurityCard> {
  bool isFaceIDEnabled = true;
  List<String> faceIDs = ["Face ID 1", "Face ID 1"];

  void _addFaceID() {
    setState(() {
      faceIDs.add("Face ID ${faceIDs.length + 1}");
    });
  }

  void _removeFaceID(int index) {
    setState(() {
      faceIDs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thanh tiêu đề có công tắc
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Face ID",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: isFaceIDEnabled,
                      onChanged: (value) {
                        setState(() {
                          isFaceIDEnabled = value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Danh sách Face ID
              Column(
                children: List.generate(faceIDs.length, (index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(faceIDs[index], style: TextStyle(fontSize: 14)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.black54),
                      onPressed: () => _removeFaceID(index),
                    ),
                  );
                }),
              ),

              // Nút thêm Face ID
              GestureDetector(
                onTap: _addFaceID,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.add, color: Colors.black54),
                      SizedBox(width: 5),
                      Text("Add Face ID", style: TextStyle(fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
