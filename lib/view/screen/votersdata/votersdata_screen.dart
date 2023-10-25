import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i2connect/data/bloc/voters_data/voters_data_cubit.dart';
import 'package:i2connect/model/voters_data/voters_data_model.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/screen/votersdata/add_or_edit_voter_data.dart';
import 'package:i2connect/view/screen/votersdata/filters_view.dart';

class VotersDataScreen extends StatefulWidget {
  const VotersDataScreen({Key? key}) : super(key: key);

  @override
  VotersDataScreenState createState() => VotersDataScreenState();
}

class VotersDataScreenState extends State<VotersDataScreen> {
  late VotersDataCubit votersDataState =
      BlocProvider.of<VotersDataCubit>(context);
  final scrollController = ScrollController();
  var refresh = '';

  @override
  void initState() {
    votersDataState.initialize();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        votersDataState.getMoreVotersData();
      }
    });
    super.initState();
  }

  void reinitial(){
    votersDataState.initialize();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        votersDataState.getMoreVotersData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<VotersDataCubit, VotersDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VoterDataOptionsWidget(
                        onTap: () { reinitial(); },
                        color: const Color(0xFFE7A03C),
                        image: Images.refresh,
                      ),
                      VoterDataOptionsWidget(
                        onTap: () {},
                        color: const Color(0xFF4AA361),
                        image: Images.excel,
                      ),
                      VoterDataOptionsWidget(
                        onTap: () {},
                        color: const Color(0xFFCD5642),
                        image: Images.pdf,
                      ),
                      VoterDataOptionsWidget(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const VoterDataFilterView(),
                          //     maintainState: false,
                          //   ),
                          // );
                          _navigateAndDisplaySelection(context);
                        },
                        color: const Color(0xFF56BDEA),
                        image: Images.filterImage,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddOrEditVoterDataView(forEdit: false, editVoter: state.votersData[0],),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 14.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF1C477A),
                              borderRadius: BorderRadius.circular(2.0)),
                          child: const Text(
                            '+ New Voter',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaNova",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 14.0),
                  color: const Color(0xFFB3C8E8),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Voter IDs',
                        style: TextStyle(
                          color: Color(0xFF0047B2),
                          fontFamily: "ProximaNova",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                ),
                Expanded(
                  child: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.black)),
                        )
                      : Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2.0, 2.0),
                                    color: Colors.black12,
                                    blurRadius: 10.0)
                              ]),
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: state.votersData.length,
                              padding: const EdgeInsets.all(0.0),
                              itemBuilder: (context, index) {
                                final votersData = state.votersData[index];
                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20.0))),
                                        builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0,
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        votersData.voterId ??
                                                            '',
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      IconButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddOrEditVoterDataView(
                                                                      forEdit:
                                                                          true, editVoter: votersData),
                                                            ),
                                                          );
                                                        },
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          color:
                                                              Color(0xFF1C477A),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () => showDialog<String>(
                                                          context: context,
                                                          builder: (BuildContext context) => AlertDialog(
                                                            title: const Text('Alert'),
                                                            content: const Text('Do you want to delete this Voter?'),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                                                child: const Text('Dismiss'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () async => {
                                                                await BlocProvider.of<VotersDataCubit>(context)
                                                                    .deleteVoter(votersData.voterId!)
                                                                    .then((value) {
                                                                if (value) {
                                                                Fluttertoast.showToast(msg: 'Voter Deleted successfully');
                                                                Navigator.pop(context);
                                                                } else {
                                                                Fluttertoast.showToast(msg: 'Failed to delete details');
                                                                }
                                                                }),
                                                                },
                                                                child: const Text('Confirm'),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color:
                                                              Color(0xFF1C477A),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () =>
                                                            Navigator.maybePop(
                                                                context),
                                                        icon: const Icon(
                                                            Icons.close),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 1.0,
                                                  thickness: 1.0,
                                                  color: Color(0xFFCCD0D6),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      14.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'First name',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF606B83),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  votersData
                                                                          .firstName ??
                                                                      '',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF263659),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Last name',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF606B83),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  votersData
                                                                          .lastName ??
                                                                      '',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF263659),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 14.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Designation',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF606B83),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  votersData
                                                                          .designation ??
                                                                      '',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF263659),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Gender',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF606B83),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  votersData
                                                                          .gender ??
                                                                      '',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF263659),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 14.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Caste',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF606B83),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  votersData
                                                                          .subCaste
                                                                          ?.toString() ??
                                                                      '',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF263659),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Phone',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF606B83),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  votersData
                                                                          .phoneNo
                                                                          ?.toString() ??
                                                                      '',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF263659),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 14.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Email',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF606B83),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  votersData
                                                                          .emailId ??
                                                                      '',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF263659),
                                                                    fontFamily:
                                                                        "ProximaNova",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 14.0),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, left: 14.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              votersData.voterId ?? '',
                                              style: const TextStyle(
                                                color: Color(0xFF046A38),
                                                fontFamily: "ProximaNova",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '${votersData.firstName ?? 'Name'}, ${votersData.gender ?? 'Gender'}, ${votersData.subCaste ?? 'Caste'}',
                                              style: const TextStyle(
                                                color: Color(0xFF263659),
                                                fontFamily: "ProximaNova",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Checkbox(value: true, onChanged: (v) {})
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
// Navigator.pop.
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VoterDataFilterView()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    print(result);
    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if(result == 'refresh'){
      reinitial();
    }
  }
}

class VoterDataOptionsWidget extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final String? image;
  const VoterDataOptionsWidget({
    Key? key,
    this.onTap,
    this.color,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 43,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(2.0)),
        child: Image.asset(image ?? ""),
      ),
    );
  }
}
