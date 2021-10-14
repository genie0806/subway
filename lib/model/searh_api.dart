import 'package:subway/model/search_data.dart';

class SearchApi {
  SearchApi({
    required this.errorMessage,
    required this.realtimeArrivalList,
  });
  late final ErrorMessage errorMessage;
  late final List<RealtimeArrivalList> realtimeArrivalList;

  SearchApi.fromJson(Map<String, dynamic> json) {
    errorMessage = ErrorMessage.fromJson(json['errorMessage']);
    realtimeArrivalList = List.from(json['realtimeArrivalList'])
        .map((e) => RealtimeArrivalList.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['errorMessage'] = errorMessage.toJson();
    _data['realtimeArrivalList'] =
        realtimeArrivalList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ErrorMessage {
  ErrorMessage({
    required this.status,
    required this.code,
    required this.message,
    required this.link,
    required this.developerMessage,
    required this.total,
  });
  late final int status;
  late final String code;
  late final String message;
  late final String link;
  late final String developerMessage;
  late final int total;

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    link = json['link'];
    developerMessage = json['developerMessage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['message'] = message;
    _data['link'] = link;
    _data['developerMessage'] = developerMessage;
    _data['total'] = total;
    return _data;
  }
}
