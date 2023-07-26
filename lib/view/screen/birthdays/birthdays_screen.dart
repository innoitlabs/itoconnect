import 'package:flutter/material.dart';

class BirthdaysScreen extends StatefulWidget {
  const BirthdaysScreen({Key? key}) : super(key: key);

  @override
  BirthdaysScreenState createState() => BirthdaysScreenState();
}

class BirthdaysScreenState extends State<BirthdaysScreen> {

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
        child: Column(children: [
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
                        showModalBottomSheet(context: context, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))
                        ), builder: (context) => Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  IconButton(onPressed: () => Navigator.maybePop(context), icon: Icon(Icons.close))
                                ],
                              ),
                            ),
                            const Divider(height: 1.0, thickness: 1.0, color: Color(0xFFCCD0D6),), Padding(
                                padding:  const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                         SizedBox(
                                           width: MediaQuery.of(context).size.width * 0.4,
                                           child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'First name',
                                                style: TextStyle(
                                                  color: Color(0xFF606B83),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'ANIL',
                                                style: TextStyle(
                                                  color: Color(0xFF263659),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                        ),
                                         ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Last name',
                                                style: TextStyle(
                                                  color: Color(0xFF606B83),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'BANDARU',
                                                style: TextStyle(
                                                  color: Color(0xFF263659),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 14.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Designation',
                                                style: TextStyle(
                                                  color: Color(0xFF606B83),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Counsellor',
                                                style: TextStyle(
                                                  color: Color(0xFF263659),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Notes',
                                                style: TextStyle(
                                                  color: Color(0xFF606B83),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'He is very important',
                                                style: TextStyle(
                                                  color: Color(0xFF263659),
                                                  fontFamily: "ProximaNova",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 14.0),
                                    Row(
                                      children: [
                                        const Text(
                                          'Call Status',
                                          style: TextStyle(
                                            color: Color(0xFF606B83),
                                            fontFamily: "ProximaNova",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Container(
                                          color: const Color(0xFFDCEFDA),
                                          margin: const EdgeInsets.only(left: 16.0),
                                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
                                          child: const Icon(Icons.phone, size: 16.0, color: Color(0xFF2DBD2A),),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],),
                        ));
                      },
                      child: Container(
                        color: Colors.white,
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
                            Container(
                              color: const Color(0xFFDCEFDA),
                              margin: const EdgeInsets.only(right: 10.0),
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
                              child: const Icon(Icons.phone, color: Color(0xFF2DBD2A),),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],),
      ),
    );
  }

}