import 'package:flutter/material.dart';

Widget infoCard({
  required IconData icon,
  required String title,
  required String subtitle,
  required String buttonText,
  required int maxLines
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          child: Icon(icon, color: Colors.teal),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: maxLines,

          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'PTSerif',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
          //  fontFamily: 'PTSerif',
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},

          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            backgroundColor: WidgetStatePropertyAll(Color(0xFF004731)),
          ),
          child: Text(buttonText, style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
