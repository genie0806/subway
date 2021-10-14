import 'package:flutter/material.dart';
import 'package:subway/subway_search.dart';

void main() {
  runApp(const SubWay());
}

class SubWay extends StatelessWidget {
  const SubWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Subway',
      home: SubwaySearch(),
    );
  }
}
