import 'package:explorer_start_hack/screen/details/bloc/details_screen_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreenBody extends StatefulWidget {
  final String facilityName;

  DetailsScreenBody(this.facilityName);

  @override
  State<StatefulWidget> createState() => DetailsScreenBodyState();
}

class DetailsScreenBodyState extends State<DetailsScreenBody> {
  List<Color> gradientColors = [Colors.red, Colors.yellow, Colors.green];

  _calendarChange(DateTime dateTime) =>
      BlocProvider.of<DetailsScreenBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("place for City name"),
        ),
        body: _detailsScreen());
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailsScreenBloc>(context).add(LoadChartEvent());
  }

  Widget _detailsScreen() => Column(children: [
        buildCalendarButton(),
        BlocBuilder<DetailsScreenBloc, DetailsScreenState>(
          builder: (context, state) {
            if (state is DetailsScreenInitial) {
              return Center(child: buildLineChart());
            } else if (state is DetailsScreenLoading) {
              return buildLoadingAnimation();
            } else if (state is DetailsScreenLoaded) {
              return Center(child: buildLineChart());
            } else {
              return Container(child: Text("Error try again later :("));
            }
          },
        )
      ]);

  Widget buildCalendarButton() => Align(
      alignment: Alignment.topRight,
      child: InkWell(
          onTap: () {},
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

  Widget buildLoadingAnimation() => CircularProgressIndicator();
}
