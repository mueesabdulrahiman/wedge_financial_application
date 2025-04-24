import 'package:flutter/material.dart';

Padding buildTabChips() {
    return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabChip(label: '1W', selected: true),
                  TabChip(label: '1M'),
                  TabChip(label: '6M'),
                  TabChip(label: '1Y'),
                  TabChip(label: 'YTD'),
                  TabChip(label: 'Max'),
                ],
              ),
            );
  }

  class TabChip extends StatelessWidget {
  final String label;
  final bool selected;
  const TabChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 30,
      width: 50,
      //fit: BoxFit.scaleDown,
      child: Chip(
        shape: StadiumBorder(),
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        label: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),

        backgroundColor: selected ? Colors.teal : Colors.grey.shade300,
        labelStyle: TextStyle(color: selected ? Colors.white : Colors.black),
      ),
    );
  }
}
