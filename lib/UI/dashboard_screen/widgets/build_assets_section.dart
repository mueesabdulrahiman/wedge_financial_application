import 'package:flutter/material.dart';

Container buildAssetsSection() {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Assets',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.add_circle_outline, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 12),
                  assetTile(
                    Icons.account_balance,
                    'Cash Accounts',
                    'USD 0.00',
                    showAdd: true,
                  ),
                  assetTile(
                    Icons.bar_chart,
                    'Investments',
                    'USD 4,000,000.00',
                  ),
                  assetTile(Icons.savings, 'Pensions', 'USD 4,000,000.00'),
                  assetTile(
                    Icons.house,
                    'Properties',
                    'USD 0.00',
                    showAdd: true,
                  ),
                ],
              ),
            );
  }

  Widget assetTile(
  IconData icon,
  String title,
  String value, {
  bool showAdd = false,
}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.teal.shade100,
      child: Icon(icon, color: Colors.teal),
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 15, fontFamily: 'PTSerif', color: Colors.grey),
    ),
    subtitle: Text(
      value,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    trailing:
        showAdd
            ? ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFF004731)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              child: Text('Add', style: TextStyle(color: Colors.white)),
            )
            : const Icon(Icons.arrow_forward_ios, size: 16),
  );
}
