import 'package:flutter/material.dart';

class MisconductCard extends StatelessWidget {
  final String cardName;
  final String imgPath;
  final VoidCallback onTap;

  const MisconductCard({
    required this.cardName,
    required this.imgPath,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(imgPath),
                ),
                const SizedBox(height: 8),
                Text(
                  cardName,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
