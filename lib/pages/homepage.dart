import 'package:flutter/material.dart';
import 'package:zero_lite/data/model/countrylist_model.dart';
import 'package:zero_lite/data/services/apiService.dart';
import 'package:zero_lite/pages/detailPage.dart';
import 'package:zero_lite/pages/searchPage.dart';
import 'package:zero_lite/widget/makeText.dart';

class HomePage extends StatefulWidget {
  final String? title;
  HomePage({
    this.title,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar(context) as PreferredSizeWidget?,
        body: FutureBuilder(
          future: ApiService().getCountryList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return LinearProgressIndicator();
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                List<CountryList> data = snapshot.data;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: makeText(
                      data[index].alpha2Code!,
                      fontWeight: FontWeight.bold,
                      size: Theme.of(context).textTheme.caption!.fontSize,
                    ),
                  ),
                  title: makeText(
                    data[index].name!,
                    fontWeight: FontWeight.bold,
                    size: Theme.of(context).textTheme.subtitle1!.fontSize,
                  ),
                  subtitle: makeText(
                    data[index].capital!,
                    size: Theme.of(context).textTheme.caption!.fontSize,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          countryList: data[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: makeText(
        widget.title!,
        color: Colors.indigo,
        fontWeight: FontWeight.bold,
        size: Theme.of(context).textTheme.headline6!.fontSize,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {
            showSearch(context: context, delegate: SearchPage());
          },
        ),
      ],
    );
  }
}
