import 'package:flutter/material.dart';
import 'package:zero_lite/data/model/countrylist_model.dart';
import 'package:zero_lite/data/services/apiService.dart';
import 'package:zero_lite/pages/detailPage.dart';
import 'package:zero_lite/widget/makeText.dart';

class SearchPage extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      color: Colors.black,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ApiService apiService = ApiService();
    return FutureBuilder(
        future: apiService.getSearchList(name: query),
        builder: (context, snapshot) {
          List<CountryList> countrylist = snapshot.data;
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView.builder(
              itemCount: countrylist.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: makeText(countrylist[index].name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailPage(
                                  countryList: countrylist[index],
                                )));
                  },
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: makeText(
        'Search Country Name',
        size: Theme.of(context).textTheme.headline6.fontSize,
      ),
    );
  }
}
