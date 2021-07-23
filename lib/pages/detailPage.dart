import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zero_lite/data/model/countrylist_model.dart';
import 'package:zero_lite/widget/elevatedButton.dart';
import 'package:zero_lite/widget/makeText.dart';

class DetailPage extends StatelessWidget {
  final CountryList? countryList;
  DetailPage({this.countryList});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context) as PreferredSizeWidget?,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              imageShow(size),
            ],
          ),
          detailCountryShow(size, context),
        ],
      ),
    );
  }

  Widget detailCountryShow(Size size, BuildContext context) {
    return Container(
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.indigo.shade400,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      transform: Matrix4.translationValues(0, -25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: makeText(
              countryList!.name!,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              size: Theme.of(context).textTheme.headline5!.fontSize,
            ),
          ),
          SizedBox(
            height: size.height * 0.026,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.04,
              left: size.width * 0.04,
            ),
            child: Container(
              height: size.height * 0.4,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: size.height * 0.04,
                  childAspectRatio: 4.5,
                ),
                children: [
                  makeChip(
                    context,
                    labelString: countryList!.capital ?? "",
                    avatarText: "C",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.nativeName ?? "",
                    avatarText: "N",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.callingCodes!.first,
                    avatarText: "CC",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.population.toString(),
                    avatarText: "P",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.area.toString(),
                    avatarText: "A",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.region.toString(),
                    avatarText: "R",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.subregion,
                    avatarText: "SR",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.timezones!.first,
                    avatarText: "T",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.languages![0].nativeName,
                    avatarText: "L",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.demonym,
                    avatarText: "D",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.altSpellings!.first,
                    avatarText: "AS",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.currencies![0].symbol,
                    avatarText: "CS",
                  ),
                  makeChip(
                    context,
                    labelString: countryList!.currencies![0].name,
                    avatarText: "CN",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Center(
            child: elevatedButton(
              context,
              textString: "More Information",
              minimumSize: Size(size.width * 0.6, size.height * 0.06),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget imageShow(Size size) {
    return Container(
      height: size.height * 0.33,
      width: size.width,
      child: SvgPicture.network(
        countryList!.flag!,
        cacheColorFilter: true,
        allowDrawingOutsideViewBox: false,
        fit: BoxFit.cover,
        placeholderBuilder: (context) =>
            Center(child: CircularProgressIndicator()),
        height: 128.0,
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.info_outline,
            color: Colors.black,
          ),
          onPressed: () {
            showAboutDialog(
              context: context,
              children: [
                makeInfoRow(
                  context,
                  rowlabelOneText: "Capital",
                  rowOneavatarText: "C",
                  rowlabelTwoText: "Native Name",
                  rowTwoavatarText: "N",
                ),
                makeInfoRow(
                  context,
                  rowlabelOneText: "Region",
                  rowOneavatarText: "R",
                  rowlabelTwoText: "Area",
                  rowTwoavatarText: "A",
                ),
                makeInfoRow(
                  context,
                  rowlabelOneText: "Population",
                  rowOneavatarText: "P",
                  rowlabelTwoText: "Language",
                  rowTwoavatarText: "L",
                ),
                makeInfoRow(
                  context,
                  rowlabelOneText: "Calling Code",
                  rowOneavatarText: "CC",
                  rowlabelTwoText: "Timezones",
                  rowTwoavatarText: "T",
                ),
                makeInfoRow(
                  context,
                  rowlabelOneText: "Currency Symbol",
                  rowOneavatarText: "S",
                  rowlabelTwoText: "Code",
                  rowTwoavatarText: "C",
                ),
                makeInfoRow(
                  context,
                  rowlabelOneText: "Demonym",
                  rowOneavatarText: "D",
                  rowlabelTwoText: "AltSpelling",
                  rowTwoavatarText: "AS",
                ),
                makeInfoRow(
                  context,
                  rowlabelOneText: "Currency Name",
                  rowOneavatarText: "CN",
                  rowlabelTwoText: "SubRegion",
                  rowTwoavatarText: "SR",
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget makeInfoRow(
    BuildContext context, {
    String? rowlabelOneText,
    String? rowlabelTwoText,
    String? rowOneavatarText,
    String? rowTwoavatarText,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        makeChip(
          context,
          labelString: rowlabelOneText,
          avatarText: rowOneavatarText,
        ),
        makeChip(
          context,
          labelString: rowlabelTwoText,
          avatarText: rowTwoavatarText,
        ),
      ],
    );
  }

  Widget makeChip(BuildContext context,
      {String? labelString, String? avatarText}) {
    return Chip(
      label: makeText(labelString ?? "",
          size: Theme.of(context).textTheme.caption!.fontSize),
      labelPadding: EdgeInsets.all(4),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade500,
        child: makeText(
          avatarText ?? "",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          size: Theme.of(context).textTheme.button!.fontSize,
        ),
      ),
    );
  }
}
