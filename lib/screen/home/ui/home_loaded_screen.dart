import 'package:flutter/cupertino.dart';

class HomeLoadedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeLoadedState();
}

class HomeLoadedState extends State<HomeLoadedScreen> {
  @override
  Widget build(BuildContext context) => Container(child: Text("Home loaded screen \n list will be here"),);
}