import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 250,
                color: Color(0xFFE6F6F8),
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 150000,
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      horizontalInterval: 25000,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.shade500,
                          strokeWidth: 1.0,
                        );
                      },
                      drawVerticalLine: false,
                      getDrawingVerticalLine: (value) {
                        return const FlLine(
                          color: Color(0xff37434d),
                          strokeWidth: 1.0,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey),
                        vertical: BorderSide(color: Colors.transparent),
                      ),
                    ),

                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 25000),
                          FlSpot(1, 110000),
                          FlSpot(2, 95000),
                          FlSpot(3, 95000),
                          FlSpot(4, 120000),
                          FlSpot(5, 120000),
                          FlSpot(6, 150000),
                        ],
                        isCurved: true,
                        barWidth: 3,
                        dotData: const FlDotData(show: false),
                        color: Colors.black,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.2, 1],
                            colors: [
                              Colors.black.withOpacity(0.1), 
                              Color.fromRGBO(
                                230,
                                246,
                                248,
                                0.8,
                              ), 
                            ],
                          ),
                        ),
                      ),
                    ],
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) {
                              return buildText('11');
                            } else if (value == 1) {
                              return buildText('12');
                            } else if (value == 2) {
                              return buildText('13');
                            } else if (value == 3) {
                              return buildText('14');
                            } else if (value == 4) {
                              return buildText('15');
                            } else if (value == 5) {
                              return buildText('16');
                            } else if (value == 6) {
                              return buildText('17');
                            }
                            return const SizedBox();
                          },
                          reservedSize: 20,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 25000:
                                return buildText('25k');
                              case 50000:
                                return buildText('50k');
                              case 100000:
                                return buildText('100k');
                              case 125000:
                                return buildText('125k');
                              case 150000:
                                return buildText('150k');
                            }
                            return const SizedBox();
                          },
                          reservedSize: 30,
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                  ),
                ),
              );
  }
    Widget buildText(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'RobotoCondensed',
        fontSize: 12,
      ),
    );
  }
}