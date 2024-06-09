import 'package:ava_take_home_project/models/credit_score_model.dart';
import 'package:ava_take_home_project/utils/app_colors.dart';
import 'package:ava_take_home_project/utils/app_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final List<CreditScoreModel> creditScoreList;
  const ChartWidget({required this.creditScoreList, super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<FlSpot> _animatedSpots = [];
  List<FlSpot> _initialSpots = [];

  @override
  void initState() {
    super.initState();
    _initialSpots = widget.creditScoreList.map((e) {
      return FlSpot(
        double.parse(e.monthNumber),
        double.parse(e.creditScore),
      );
    }).toList();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _controller.forward();

    _controller.addListener(() {
      setState(() {
        _animatedSpots = _initialSpots
            .map((spot) => FlSpot(spot.x * _controller.value, spot.y))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            verticalInterval: 15,
            horizontalInterval: 50,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.5),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: true,
              getTextStyles: (context, value) => atInterSemiBold14Grey,
              margin: 8,
              reservedSize: 32,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 600:
                    return '600';
                  case 650:
                    return '650';
                  case 700:
                    return '700';
                }
                return '';
              },
            ),
            rightTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
          ),
          minX: 1,
          maxX: 12,
          minY: 600,
          maxY: 750,
          borderData: FlBorderData(
            show: true,
            // draw on the bottom of the chart
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: _animatedSpots,
              isCurved: true,
              colors: [acGreen],
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: acGreen,
                ),
              ),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
