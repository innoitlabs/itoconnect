import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/button/custom_button.dart';
import 'package:i2connect/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
import 'package:i2connect/view/screen/ecampaigns/compose_view.dart';
import 'package:i2connect/view/screen/ecampaigns/groups_view.dart';
import 'package:i2connect/view/screen/ecampaigns/new_group.dart';
import 'package:provider/provider.dart';
import 'package:i2connect/view/basewidget/custom_app_bar.dart';

class ECampaignsScreen extends StatefulWidget {
  const ECampaignsScreen({Key? key}) : super(key: key);

  @override
  ECampaignsScreenState createState() => ECampaignsScreenState();
}

class ECampaignsScreenState extends State<ECampaignsScreen> {
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
                        hintText: 'Caste/Vote Favour',
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
                  onTap: () {
                    showModalBottomSheet(context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                        decoration: const BoxDecoration(color: Color(0xFFADD8C3), borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          GestureDetector(
                            onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ComposeView(composeType: 'WhatsApp')));
                      },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                  child:  Image.asset('assets/images/whatsapp.png'),
                                ),
                                const SizedBox(height: 6.0),
                                const Text(
                                  'WhatsApp',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "ProximaNova",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ComposeView(composeType: 'SMS')));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                  child: Image.asset('assets/images/textsms.png'),
                                ),
                                const SizedBox(height: 6.0),
                                const Text(
                                  'SMS',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "ProximaNova",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],),
                      );
                    });
                  },
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GroupsView()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 14.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1C477A),
                          borderRadius: BorderRadius.circular(2.0)),
                      child: const Text(
                        'Groups',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "ProximaNova",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NewGroupView()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 14.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1C477A),
                          borderRadius: BorderRadius.circular(2.0)),
                      child: const Text(
                        '+ New Group',
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
                      return Padding(
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
