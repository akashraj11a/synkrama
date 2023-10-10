import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  String image;

  ImageCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}