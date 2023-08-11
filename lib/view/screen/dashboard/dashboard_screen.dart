import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/button/custom_button.dart';
import 'package:i2connect/view/basewidget/button/blue_button.dart';
import 'package:i2connect/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:i2connect/view/basewidget/custom_app_bar.dart';
import 'package:i2connect/view/screen/ecampaigns/ecampaigns_screen.dart';
import 'package:i2connect/view/screen/calendar/calendar_screen.dart';
import 'package:i2connect/view/screen/votersdata/votersdata_screen.dart';
import 'package:i2connect/view/screen/birthdays/birthdays_screen.dart';
import 'package:i2connect/view/screen/dashboard/widgets/charts.dart';
import 'package:i2connect/view/screen/dashboard/widgets/important_people.dart';
import 'package:i2connect/view/screen/dashboard/widgets/ward_issues.dart';
import 'package:i2connect/view/screen/dashboard/widgets/todo_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();
  List<bool> expanded = [false, false];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ECampaignsScreen()));
          break;
        case 2:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CalendarScreen()));
          break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const VotersDataScreen()));
          break;
        case 4:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const BirthdaysScreen()));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    children: [
                      //Total Voters
                      Container(
                        child: Column(
                          children: [
                            Divider(
                              height: 20,
                              thickness: 2,
                              endIndent: 0,
                              color: ColorResources.getDividerGrey(context),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Constituency",
                                    style: titleTabHeader,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(Images.expansionTileIcon),
                                ],
                              ),
                            ),
                            Divider(
                              height: 20,
                              thickness: 2,
                              endIndent: 0,
                              color: ColorResources.getDividerGrey(context),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: Column(children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  color: Color(0xFF00AF85),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total Voters",
                                              style: constituencyCardText,
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "2,25,000",
                                              style: constituencyCardTextLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          child: Image.asset(
                                        Images.groupIcon,
                                      ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  color: Color(0xFF24469D),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Male Voters",
                                          style: constituencyCardText,
                                        ),
                                        Text(
                                          "1,30,000",
                                          style: constituencyCardTextMedium,
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  color: Color(0xFFBC46B0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Female Voters",
                                          style: constituencyCardText,
                                        ),
                                        Text(
                                          "1,30,000",
                                          style: constituencyCardTextMedium,
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  color: Color(0xFFDFB23E),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Other",
                                          style: constituencyCardText,
                                        ),
                                        Text(
                                          "1,30,000",
                                          style: constituencyCardTextMedium,
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            "View as Chart",
                                            style: TextStyle(
                                              fontFamily: 'ProximaNova',
                                              fontSize: 13,
                                              color: Color(0xFF0047B2),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          onTap: () => print("View as Chart"),
                                        ),
                                      ]),
                                ),
                              ]),
                            ),
                            Divider(
                              height: 20,
                              thickness: 2,
                              endIndent: 0,
                              color: ColorResources.getDividerGrey(context),
                            ),
                          ],
                        ),
                      ),
                      //Charts Card
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 8,
                                              bottom: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xFF0047B2),
                                              width: 1,
                                              style: BorderStyle.solid,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Caste/Vote Favor",
                                                style: TextStyle(
                                                    color: Color(0xFFAEAEAE),
                                                    fontFamily: "ProximaNova",
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Image.asset(
                                                  Images.expansionTileIcon)
                                            ],
                                          ))),
                                  Container(
                                    //margin: const EdgeInsets.only(left: 100, right: 100, bottom: 20, top: 30),
                                    child: BlueButton(
                                      buttonText: 'Filter',
                                      width: 80,
                                      height: 38,
                                      radius: 5,
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const DashboardScreen())),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 5),
                              child: Text(
                                "Search appears based on filters",
                                style: titleSemiMedium,
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                            DashBoardCharts(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Color(0XFFE1E1E1),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ],
                                        ),
                                    child: Center(
                                        child: const Icon(
                                      Icons.chevron_left,
                                      color: Color(0xFF717171),
                                      size: 40,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ],
                                        border: Border.all(
                                            width: 0.5, color: Color(0xFFD8D8D8)),
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.white),
                                    child: Center(
                                        child: const Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      size: 40,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            ImportantPeople(isDashboard: true,),
                            SizedBox(height: 15,),
                            WardIssues(isDashboard: true,),
                            SizedBox(height: 15,),
                            TodoList(),
                            SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
