import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/screen/dashboard/list_full_screen.dart';
class WardIssues extends StatelessWidget {
  final bool isDashboard;
  const WardIssues({Key? key, this.isDashboard = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: this.isDashboard ? 205 : MediaQuery.of(context).size.height * 0.75,
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
          border: Border.all(
              width: 1, color: Color(0xFFD8D8D8))),
      child: Column(
        children: [
          InkWell(
            child: Text(
              'Ward/Village Issues',
              style: titleTabHeader,
            ),
            onTap: (){
              if(this.isDashboard == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ListFullScreen(screenType: 'WardIssues')));
              }
            },
          ),
          SizedBox(height: 5,),
          Container(
            height: 35,
            color: Color(0xFFB3C8E8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Title", style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF36588C)) ,),
                Text("Status", style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF36588C)) ,),
              ],
            ),
          ),
          Container(
            height: this.isDashboard ? 130 : MediaQuery.of(context).size.height * 0.64,
            child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index)  {
                  return Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                          Text("Power Issue", style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF444444)) ,),
                          Text("Counsellor", style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xFF2BA721)) ,),
                        ]
                    ),
                  );
                },
                itemCount: 10),
          ),


        ],
      ),
    );
  }
}
