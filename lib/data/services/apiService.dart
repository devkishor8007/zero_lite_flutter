import 'package:zero_lite/data/model/countrylist_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String url = "https://restcountries.eu/rest/v2/all";
  Iterable<CountryList> countryData = [];

  Future<List<CountryList>> getCountryList() async {
    var resp = await http.get(Uri.parse(url));

    countryData = countryListFromJson(resp.body);
    return countryData;
  }

  Future<List<CountryList>> getSearchList({String name}) async {
    var resp = await http.get(Uri.parse(url));

    countryData = countryListFromJson(resp.body);
    if (name != null) {
      countryData = countryData
          .where((element) => element.name.toLowerCase().contains(name))
          .toList();
    }
    return countryData;
  }
}
