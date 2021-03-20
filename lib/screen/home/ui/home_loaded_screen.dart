import 'package:explorer_start_hack/model/location_dto.dart';
import 'package:explorer_start_hack/screen/details/ui/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLoadedScreen extends StatelessWidget {
  final List<LocationDto> locations;

  HomeLoadedScreen(this.locations);

  @override
  Widget build(BuildContext context) => Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: () => _onItemTapped(context),
          title: _locationListTile(locations[index]),
        ),
        itemCount: locations.length,
      ));

  _onItemTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // TODO provide data to the constructor
        builder: (context) => DetailsScreen(),
      ),
    );
  }

  _locationListTile(LocationDto itemData) => Padding(
      padding: EdgeInsets.only(top: 2, bottom: 2),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                itemData.name,
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Spacer(),
              Text(
                itemData.totalFreeSpaces.toString(),
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 28,
                    shadows: <Shadow>[
                      Shadow(blurRadius: 2.0, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          )));
}
