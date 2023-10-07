import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/voters_data/voters_data_cubit.dart';
import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';
import 'package:i2connect/util/app_constants.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/enum.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/screen/dashboard/dashboard_screen.dart';

class VoterDataFilterView extends StatefulWidget {
  const VoterDataFilterView({Key? key}) : super(key: key);

  @override
  State<VoterDataFilterView> createState() => _VoterDataFilterViewState();
}

class _VoterDataFilterViewState extends State<VoterDataFilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: BlocConsumer<VotersDataCubit, VotersDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          String constituencyTitle =
              getConstituencyTitle(state.selectedConstituencies ?? []);
          String mandalTitle = getMandalTitle(state.selectedMandal ?? []);
          String villageTitle = getVillageTitle(state.selectedVillages ?? []);
          String pollingTitle = getPollingTitle(state.selectedPollings ?? []);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50.0,
                  child: VoterDataFilterWidgetWidget(
                    type: DashboardPopupType.constituency,
                    title: constituencyTitle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50.0,
                  child: VoterDataFilterWidgetWidget(
                    type: DashboardPopupType.mandal,
                    title: mandalTitle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50.0,
                  child: VoterDataFilterWidgetWidget(
                    type: DashboardPopupType.village,
                    title: villageTitle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50.0,
                  child: VoterDataFilterWidgetWidget(
                    type: DashboardPopupType.polling,
                    title: pollingTitle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 1),
                              color: Colors.black26.withOpacity(0.3),
                              blurRadius: 10.0)
                        ]),
                    alignment: Alignment.center,
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "ProximaNova",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<dynamic> voterDataFilterPopupDialog(
    {required BuildContext context, required DashboardPopupType type}) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: DashboardPopupWidget(type: type),
    ),
  );
}

class VoterDataFilterWidgetWidget extends StatelessWidget {
  final DashboardPopupType type;
  final String title;
  const VoterDataFilterWidgetWidget({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => voterDataFilterPopupDialog(context: context, type: type),
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
    return BlocConsumer<VotersDataCubit, VotersDataState>(
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
                width: 300,
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
                            BlocProvider.of<VotersDataCubit>(context)
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
                width: 300,
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
                            BlocProvider.of<VotersDataCubit>(context)
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
                width: 300,
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
                            BlocProvider.of<VotersDataCubit>(context)
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
                width: 300,
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
                            BlocProvider.of<VotersDataCubit>(context)
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
