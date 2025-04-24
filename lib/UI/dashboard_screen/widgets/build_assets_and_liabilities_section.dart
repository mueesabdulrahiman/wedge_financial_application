import 'package:flutter/material.dart';

Container buildAssetsAndLiabilitiesSection() {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assets',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Liabilities',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Color(0xFF004731), thickness: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'USD 50,000,000.00',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('USD 0.00', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            );
  }
