import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("place for City name"),
        ),
        body: DetailsScreenBody());
  }
}

class DetailsScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailsScreenBodyState();
}

class DetailsScreenBodyState extends State<DetailsScreenBody> {

  List<Color> gradientColors = [Colors.red, Colors.yellow, Colors.green];


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      buildCalendarButton(),
      Center(child: buildLineChart()),
      buildCalendarButton()
    ]);
  }


  Widget buildCalendarButton() => Align(
      alignment: Alignment.topRight,
      child: InkWell(
          onTap: () {
            print("dialog with calendar");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("data"), Icon(Icons.calendar_today)],
          )));

  Widget buildLineChart() => Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: LineChart(LineChartData(
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        minY: 0,
        maxY: 100,
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTextStyles: (value) => const TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
              getTitles: (value) {
                if (value.toInt() % 3 == 1) {
                  return value.toInt().toString() + ':00';
                }
                return '';
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              reservedSize: 19,
              getTextStyles: (value) => const TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
              getTitles: (value) {
                if (value.toInt() % 10 == 0) {
                  return value.toInt().toString() + '%';
                }
                return '';
              },
            )),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 90),
              FlSpot(2, 20),
              FlSpot(5, 50),
              FlSpot(10, 70),
              FlSpot(23, 10),
              FlSpot(24, 20),
            ],
            isCurved: true,
            barWidth: 5,
            colors:
                gradientColors.map((color) => color.withOpacity(0.6)).toList(),
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.4))
                  .toList(),
              show: true,
            ),
          ),
        ],
      )));
}
