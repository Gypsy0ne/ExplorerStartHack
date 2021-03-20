import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      buildCalendarButton(),
      Column(children: [buildLineChart(), buildPercentageContainer()]),
      buildCalendarButton()
    ]);
  }


  Widget buildPercentageContainer() => Expanded(
      child: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Icon(Icons.pregnant_woman)));

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

  Widget buildLineChart() {
    var y1 = null;
        return LineChart(  
            LineChartData(
           borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
          minX: 0, minY: 0, maxY: 100,


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
          curveSmoothness: 0.2,
            isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
        
      ));
  }
}
