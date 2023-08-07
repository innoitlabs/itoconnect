import 'package:flutter/material.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/screen/ecampaigns/new_group.dart';
import 'package:i2connect/view/screen/votersdata/add_or_edit_voter_data.dart';

class VotersDataScreen extends StatefulWidget {
  const VotersDataScreen({Key? key}) : super(key: key);

  @override
  VotersDataScreenState createState() => VotersDataScreenState();
}

class VotersDataScreenState extends State<VotersDataScreen> {
  final dropDownTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: TextField(
                      controller: dropDownTextController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter Voter ID Number',
                        hintStyle: TextStyle(
                          color: Color(0xFFAEAEAE),
                          fontFamily: "ProximaNova",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding:
                            EdgeInsets.only(top: 0.0, left: 14.0, bottom: 10.0),
                        suffix: Icon(Icons.arrow_drop_down),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF0047B2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF0047B2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 30.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF528BB8),
                        borderRadius: BorderRadius.circular(2.0)),
                    child: const Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "ProximaNova",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VoterDataOptionsWidget(
                    onTap: () {},
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
                    onTap: () {},
                    color: const Color(0xFF56BDEA),
                    image: Images.settings,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AddOrEditVoterDataView(forEdit: false),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
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
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2.0, 2.0),
                          color: Colors.black12,
                          blurRadius: 10.0)
                    ]),
                child: ListView.builder(
                    itemCount: 20,
                    padding: const EdgeInsets.all(0.0),
                    itemBuilder: (context, index) {
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
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 8.0, bottom: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'SGE1498963',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontFamily: "ProximaNova",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddOrEditVoterDataView(
                                                            forEdit: true),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Color(0xFF1C477A),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Color(0xFF1C477A),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  Navigator.maybePop(context),
                                              icon: const Icon(Icons.close),
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
                                        padding: const EdgeInsets.all(14.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'First name',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF606B83),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'ANIL',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF263659),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Last name',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF606B83),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'BANDARU',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF263659),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 14.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Designation',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF606B83),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Counsellor',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF263659),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Gender',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF606B83),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Male',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF263659),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 14.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Caste',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF606B83),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Reddy',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF263659),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Gender',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF606B83),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        '+91234567890',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF263659),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 14.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Email',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF606B83),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'abcd@gmail.com',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF263659),
                                                          fontFamily:
                                                              "ProximaNova",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 14.0),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SGE1498963',
                                    style: TextStyle(
                                      color: Color(0xFF046A38),
                                      fontFamily: "ProximaNova",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Anil Bandaru, Male, Reddy',
                                    style: TextStyle(
                                      color: Color(0xFF263659),
                                      fontFamily: "ProximaNova",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Checkbox(value: true, onChanged: (v) {})
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
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
