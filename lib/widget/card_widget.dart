import 'package:flutter/material.dart';
import 'package:subway/model/search_data.dart';

class CardWidget extends StatelessWidget {
  final RealtimeArrivalList subwayList;
  const CardWidget({Key? key, required this.subwayList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[100],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              child: Icon(
                Icons.subway_outlined,
                size: 100,
              ),
            ),
            Text(
              subwayList.trainLineNm,
              softWrap: true,
            ),
            Text(subwayList.arvlMsg2),
            Text(subwayList.barvlDt),
          ],
        ),
      ),
    );
  }
}
