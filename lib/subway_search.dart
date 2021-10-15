import 'package:flutter/material.dart';
import 'package:subway/model/api_model.dart';
import 'package:subway/model/search_data.dart';
import 'package:subway/widget/card_widget.dart';
import 'package:subway/widget/search_bar.dart';

class SubwaySearch extends StatefulWidget {
  const SubwaySearch({Key? key}) : super(key: key);

  @override
  State<SubwaySearch> createState() => _SubwaySearchState();
}

class _SubwaySearchState extends State<SubwaySearch> {
  final _searchController = TextEditingController();
  final _query = '';
  final _apiData = SubwayApi();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunway Search'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: Searchbar(
                      controller: _searchController,
                      onChanged: (query) {
                        setState(() {
                          query = _query;
                        });
                      }),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/search.png'),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<RealtimeArrivalList>>(
            initialData: const [],
            future: _apiData.fetchSearchData(
                _searchController.text.isEmpty ? '용산' : _searchController.text),
            builder:
                (context, AsyncSnapshot<List<RealtimeArrivalList>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Image.asset('assets/progress.gif'));
              }
              if (snapshot.hasError) {
                const Text('망했다 에러다');
              }
              final _apiresult = snapshot.data ?? [];
              return GridView.count(
                  childAspectRatio: 0.9 / 1,
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: _apiresult
                      .where((e) => e.statnNm
                          .toLowerCase()
                          .contains(_query.trim().toLowerCase()))
                      .map((e) => CardWidget(
                            subwayList: e,
                          ))
                      .toList());
            },
          )
        ],
      ),
    );
  }
}
