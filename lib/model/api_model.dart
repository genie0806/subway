import 'dart:convert';

import 'package:subway/model/search_data.dart';
import 'package:http/http.dart' as http;
import 'package:subway/model/searh_api.dart';

class SubwayApi {
  static const baseUrl =
      'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/';

  Future<List<RealtimeArrivalList>> fetchSearchData(String searchWord) async {
    final response = await http.get(Uri.parse('$baseUrl$searchWord'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    SearchApi searchdata = SearchApi.fromJson(jsonResponse);
    return searchdata.realtimeArrivalList;
  }
}
