

import 'package:explorer_start_hack/screen/details/bloc/details_screen_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_chooser_dialog.dart';

class DetailsScreenBody extends StatefulWidget {
  final String facilityName;

  DetailsScreenBody(this.facilityName);

  @override
  State<StatefulWidget> createState() => DetailsScreenBodyState(this.facilityName);
}

class DetailsScreenBodyState extends State<DetailsScreenBody> {
  List<Color> gradientColors = [Colors.red, Colors.yellow, Colors.green];

  final String facilityName;
  DetailsScreenBodyState(this.facilityName);


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
    BlocProvider.of<DetailsScreenBloc>(context).add(LoadChartEvent(this.facilityName, '2021-03-21-10' ));
  }

  Widget _detailsScreen() => Column(children: [
        buildCalendarButton(),
        BlocBuilder<DetailsScreenBloc, DetailsScreenState>(
          builder: (context, state) {
            if (state is DetailsScreenInitial) {
              return Center(child: buildLineChart((state as DetailsScreenLoaded).details.predictions.asMap()));
            } else if (state is DetailsScreenLoading) {
              return buildLoadingAnimation();
            } else if (state is DetailsScreenLoaded) {
              return Center(child: buildLineChart((state as DetailsScreenLoaded).details.predictions.asMap()));
            } else {
              return Container(child: Text("Error try again later :("));
            }
          },
        )
      ]);

  Widget buildCalendarButton() => Align(
      alignment: Alignment.topRight,
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => buildDatePicker()));

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("data"), Icon(Icons.calendar_today)],
          )));

  Widget buildLineChart(Map<int, double> spots) => Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: LineChart(LineChartData(
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        minY: 0,
        maxY: 4,
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

                switch (value.toInt()) {
                  case 0:
                    return 'Low';
                  case 1:
                    return 'Medium';
                  case 2:
                    return 'High';
                }
                return '';
              },

            )),
        lineBarsData: [
          LineChartBarData(
            spots: spots.entries.map((entry) => FlSpot(entry.key.toDouble(), entry.value)).toList(),
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

  Widget buildDatePicker() => CupertinoDatePicker(
  mode: CupertinoDatePickerMode.date,
  onDateTimeChanged: (dateTime) {
  print(dateTime);}
  );
}
