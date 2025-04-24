import 'package:flutter/material.dart';

class PasswordRequirement extends StatelessWidget {
  final String text;
  final bool isMet;

  const PasswordRequirement({
    super.key,
    required this.text,
    required this.isMet,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isMet ? Colors.green : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: isMet ? Colors.green : Colors.grey),
            ),
            child:
                isMet
                    ? const Icon(Icons.check, color: Colors.white, size: 14)
                    : null,
          ),
          const SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 15.0, color: Colors.black)),
        ],
      ),
    );
  }
}
