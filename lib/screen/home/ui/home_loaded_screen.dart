import 'package:explorer_start_hack/model/location_dto.dart';
import 'package:explorer_start_hack/screen/home/bloc/home_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLoadedScreen extends StatelessWidget {
  final List<LocationDto> locations;

  HomeLoadedScreen(this.locations);

  @override
  Widget build(BuildContext context) => Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () => _onItemTapped(context, locations[index].facility),
          title: _locationListTile(locations[index]),
        ),
        itemCount: locations.length,
      ));

  _onItemTapped(BuildContext context, String facilityName) {
    BlocProvider.of<HomeScreenBloc>(context)
        .add(NavigateToDetailsEvent(facilityName));
  }

  _locationListTile(LocationDto itemData) => Padding(
      padding: EdgeInsets.only(top: 2, bottom: 2),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                itemData.facility,
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Spacer(),
              Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Text(itemData.maxSpots.toString(),
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: _getAvailabilityStateColorMapping(itemData.takenAll),
                      fontSize: 12,
                    ))),
                Text("Total spots",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: _getAvailabilityStateColorMapping(itemData.takenAll),
                          fontSize: 10,
                    )))
              ])
            ],
          )));

    Color _getAvailabilityStateColorMapping(int state) {
      switch(state) {
        case 0: {
          return Colors.red;
        }
        break;

        case 1: {
          return Colors.yellow;
        }
        break;

        case 2: {
          return Colors.green;
        }
        break;
        default: {
          return Colors.green;
        }
      }
    }
}


