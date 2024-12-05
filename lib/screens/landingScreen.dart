import 'package:ds_demo_afaq/custom/BorderBox.dart';
import 'package:ds_demo_afaq/custom/OptionButton.dart';
import 'package:ds_demo_afaq/utils/constant.dart';
import 'package:ds_demo_afaq/utils/custom_functions.dart';
import 'package:ds_demo_afaq/utils/sample_data.dart';
import 'package:ds_demo_afaq/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BorderBox(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.menu,
                                color: COLOR_BLACK,
                              )),
                          BorderBox(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.settings,
                                color: COLOR_BLACK,
                              ))
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "City",
                        style: themeData.textTheme.bodyText2,
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "San Francico",
                        style: themeData.textTheme.headline1,
                      ),
                    ),
                    Padding(
                        padding: sidePadding,
                        child: Divider(
                          height: padding,
                          color: COLOR_GREY,
                        )),
                    addVerticalSpace(10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          "<\$220,000,",
                          "for sale",
                          "3_4 Beds",
                          ">1000 sqft"
                        ]
                            .map((filter) => ChoiceOption(text: filter))
                            .toList(),
                      ),
                    ),
                    addVerticalSpace(10),
                    Expanded(
                      child: Padding(
                        padding: sidePadding,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                            itemCount: RE_DATA.length,
                            itemBuilder: (context, index) {
                              return RealEstateItem(itemDat: RE_DATA[index]);
                            }),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 40,
                    width: size.width,
                    child: Center(
                      child: OptionButton(
                  icon: Icons.map_rounded,
                  text: "Map View",
                  width:size.width * 0.35,
                ),
                    ))
              ],
            )),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic? itemDat;

  const RealEstateItem({super.key, required this.itemDat});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemDat["image"])),
              Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.favorite_border,
                      color: COLOR_BLACK,
                    ),
                  ))
            ],
          ),
          addVerticalSpace(15.0),
          Row(
            children: [
              Text(
                "${formatCurrency(itemDat["amount"])}",
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10.0),
              Text(
                "${itemDat["address"]}",
                style: themeData.textTheme.bodyText2,
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemDat["bedrooms"]}bedrooms/${itemDat["bathrooms"]}bathrooms/${itemDat["area"]}saft",
            style: themeData.textTheme.headline5,
          )
        ],
      ),
    );
  }
}
