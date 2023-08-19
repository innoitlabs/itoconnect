import 'package:flutter/material.dart';
import 'package:i2connect/model/dashboard/important_people/important_people_model.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/screen/dashboard/list_full_screen.dart';

class ImportantPeople extends StatelessWidget {
  final List<ImportantPeopleModel> importantPeopleList;
  const ImportantPeople({Key? key, required this.importantPeopleList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(importantPeopleList.length);
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 205,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).highlightColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5)
          ],
          border: Border.all(width: 1, color: Color(0xFFD8D8D8))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Text(
                  'Important People',
                  style: titleTabHeader,
                ),
                onTap: () {
                  // if(this.isDashboard == true) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (_) => const ListFullScreen(screenType: 'ImportantPeople',)));
                  // }
                },
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 35,
            color: Color(0xFFB3C8E8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF36588C)),
                ),
                Text(
                  "Designation",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF36588C)),
                ),
                Text(
                  " ",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF36588C)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  final details = importantPeopleList[index];
                  return Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              details.first_name ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF444444)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            width: MediaQuery.of(context).size.width / 3,
                            alignment: Alignment.center,
                            child: Text(
                              details.designation ?? '',
                              style: const TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF444444)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.call,
                                color: Color(0xFF046A38),
                              ),
                            ),
                          ),
                        ]),
                  );
                },
                itemCount: importantPeopleList.length),
          ),
        ],
      ),
    );
  }
}
