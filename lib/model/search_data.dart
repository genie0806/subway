import 'package:json_annotation/json_annotation.dart';
part 'arrival_list.g.dart';

@JsonSerializable()
class RealtimeArrivalList {
  String trainLineNm;
  String statnNm;
  String barvlDt;
  String arvlMsg2;

  RealtimeArrivalList(
      this.arvlMsg2, this.barvlDt, this.statnNm, this.trainLineNm);

  factory RealtimeArrivalList.fromJson(Map<String, dynamic> json) =>
      _$RealtimeArrivalListFromjson(json);
  Map<String, dynamic> toJson() => _$RealtimeArrivalListToJson(this);
}
