import 'package:flutter/material.dart';

Padding buildNetWorthDisplayWidget() {
    return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Net Worth',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PTSerif',
                          color: Colors.black54,
                        ),
                      ),

                      Row(
                        children: [
                          Icon(Icons.notifications_none),
                          SizedBox(width: 16),
                          Icon(Icons.menu),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'USD 12,500,000.00',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.green),
                      Text(
                        ' USD 234,567.89 (6.89%)',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Last updated 9 hours ago',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            );
  }

