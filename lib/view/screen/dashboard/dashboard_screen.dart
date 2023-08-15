import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/dashboard/dashboard_cubit.dart';
import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';
import 'package:i2connect/util/app_constants.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/enum.dart';
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
  final _scrollController = ScrollController();
  List<bool> expanded = [false, false];
  var dropdown;
  @override
  void initState() {
    BlocProvider.of<DashboardCubit>(context).initialize();
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
      body: BlocConsumer<DashboardCubit, DashboardState>(
        buildWhen: (previous, current) => previous != current,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          String constituencyTitle =
              getConstituencyTitle(state.selectedConstituencies);
          String mandalTitle = getMandalTitle(state.selectedMandal);
          String villageTitle = getVillageTitle(state.selectedVillages);
          String pollingTitle = getPollingTitle(state.selectedPollings);

          return SafeArea(
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
                          Column(
                            children: [
                              Divider(
                                // height: 20,
                                thickness: 2,
                                endIndent: 0,
                                color: ColorResources.getDividerGrey(context),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     const Text(
                              //       "Constituency",
                              //       style: titleTabHeader,
                              //     ),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     Image.asset(Images.expansionTileIcon),
                              //   ],
                              // ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.marginSizeSmall,
                                    vertical: Dimensions.marginSizeSmall),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DashboardWidget(
                                      type: DashboardPopupType.constituency,
                                      title: constituencyTitle,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    DashboardWidget(
                                      type: DashboardPopupType.mandal,
                                      title: mandalTitle,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: Dimensions.marginSizeSmall),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DashboardWidget(
                                      type: DashboardPopupType.village,
                                      title: villageTitle,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    DashboardWidget(
                                      type: DashboardPopupType.polling,
                                      title: pollingTitle,
                                    )
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
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Column(children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    color: const Color(0xFF00AF85),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Total Voters",
                                              style: constituencyCardText,
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              state.voutersCount.total_voters
                                                      ?.toString() ??
                                                  '--',
                                              style: constituencyCardTextLarge,
                                            ),
                                          ],
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
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10),
                                    color: const Color(0xFF24469D),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Male Voters",
                                            style: constituencyCardText,
                                          ),
                                          Text(
                                            state.voutersCount.male_voters
                                                    ?.toString() ??
                                                '--',
                                            style: constituencyCardTextMedium,
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10),
                                    color: const Color(0xFFBC46B0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Female Voters",
                                            style: constituencyCardText,
                                          ),
                                          Text(
                                            state.voutersCount.female_voters
                                                    ?.toString() ??
                                                '--',
                                            style: constituencyCardTextMedium,
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10),
                                    color: const Color(0xFFDFB23E),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Other",
                                            style: constituencyCardText,
                                          ),
                                          Text(
                                            state.voutersCount.other_voters
                                                    ?.toString() ??
                                                '--',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            child: const Text(
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Caste/Vote Favor",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFAEAEAE),
                                                        fontFamily:
                                                            "ProximaNova",
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
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Color(0XFFE1E1E1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
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
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 5)
                                            ],
                                            border: Border.all(
                                                width: 0.5,
                                                color: Color(0xFFD8D8D8)),
                                            borderRadius:
                                                BorderRadius.circular(40),
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
                                SizedBox(
                                  height: 15,
                                ),
                                ImportantPeople(
                                  importantPeopleList:
                                      state.importantPeopleList,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                WardIssues(
                                  isDashboard: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TodoList(),
                                SizedBox(
                                  height: 30,
                                ),
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
          );
        },
      ),
    );
  }
}

Future<dynamic> dashboardPopupDialog(
    {required BuildContext context, required DashboardPopupType type}) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: DashboardPopupWidget(type: type),
    ),
  );
}

class DashboardWidget extends StatelessWidget {
  final DashboardPopupType type;
  final String title;
  const DashboardWidget({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => dashboardPopupDialog(context: context, type: type),
        child: Container(
          width: double.infinity,
          height: 50.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 14.0, right: 4.0),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Image.asset(Images.expansionTileIcon),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPopupWidget extends StatelessWidget {
  final DashboardPopupType type;
  const DashboardPopupWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (type == DashboardPopupType.constituency) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Contituencies',
                style: popupHeader,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: state.dropdownDetails.constituencies?.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            state.dropdownDetails.constituencies?[index]
                                    .mla_constituency_name ??
                                '',
                            overflow: TextOverflow.ellipsis,
                            style: popupText,
                          ),
                        ),
                        Checkbox(
                          activeColor: const Color(0xFF046A38),
                          value: state.selectedConstituencies.contains(
                              state.dropdownDetails.constituencies?[index]),
                          onChanged: (v) {
                            BlocProvider.of<DashboardCubit>(context)
                                .updateSelectedConstituency(
                              state.dropdownDetails.constituencies![index],
                              v ?? false,
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (type == DashboardPopupType.mandal) {
          List<MandalModel> segredatedMandalList = [];
          for (var constituency in state.selectedConstituencies) {
            if (state.dropdownDetails.mandal?.isNotEmpty ?? false) {
              for (var mandal in state.dropdownDetails.mandal!) {
                if (mandal.constituency_id == constituency.constituency_id) {
                  segredatedMandalList.add(mandal);
                }
              }
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Mandal',
                style: popupHeader,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: segredatedMandalList.length,
                  itemBuilder: (context, index) {
                    MandalModel? mandalDetails = segredatedMandalList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            mandalDetails.mandal_name ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: popupText,
                          ),
                        ),
                        Checkbox(
                          activeColor: const Color(0xFF046A38),
                          value: state.selectedMandal.contains(mandalDetails),
                          onChanged: (v) {
                            BlocProvider.of<DashboardCubit>(context)
                                .updateSelectedMandals(
                              state.dropdownDetails.mandal![index],
                              v ?? false,
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (type == DashboardPopupType.village) {
          List<VillageModal> segredatedVillageList = [];
          for (var mandal in state.selectedMandal) {
            if (state.dropdownDetails.villages?.isNotEmpty ?? false) {
              for (var village in state.dropdownDetails.villages!) {
                if (mandal.mandal_id == village.mandal_id) {
                  segredatedVillageList.add(village);
                }
              }
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Villages',
                style: popupHeader,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: segredatedVillageList.length,
                  itemBuilder: (context, index) {
                    VillageModal? villageDetails = segredatedVillageList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            villageDetails.ward_village_name ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: popupText,
                          ),
                        ),
                        Checkbox(
                          activeColor: const Color(0xFF046A38),
                          value:
                              state.selectedVillages.contains(villageDetails),
                          onChanged: (v) {
                            BlocProvider.of<DashboardCubit>(context)
                                .updateSelectedVillages(
                              villageDetails,
                              v ?? false,
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (type == DashboardPopupType.polling) {
          List<PollingModel> segredatedPollingList = [];
          for (var village in state.selectedVillages) {
            if (state.dropdownDetails.polling?.isNotEmpty ?? false) {
              for (var polling in state.dropdownDetails.polling!) {
                if (polling.ward_village_id == village.ward_village_id) {
                  segredatedPollingList.add(polling);
                }
              }
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Polling',
                style: popupHeader,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: segredatedPollingList.length,
                  itemBuilder: (context, index) {
                    PollingModel? pollingDetails = segredatedPollingList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${index + 1} - ${pollingDetails.polling_booth_name ?? ''}',
                            overflow: TextOverflow.ellipsis,
                            style: popupText,
                          ),
                        ),
                        Checkbox(
                          activeColor: const Color(0xFF046A38),
                          value:
                              state.selectedPollings.contains(pollingDetails),
                          onChanged: (v) {
                            BlocProvider.of<DashboardCubit>(context)
                                .updateSelectedPolling(
                              pollingDetails,
                              v ?? false,
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
