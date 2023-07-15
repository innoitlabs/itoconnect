import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/images.dart';
class DashBoardCharts extends StatelessWidget {
  const DashBoardCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 420,
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
          Text(
            'Caste',
            style: titleTabHeader,
          ),
          Divider(
            thickness: 2,
            color: Color(0xFFD9D9D9),
          ),
          Image.asset(Images.pieChart),
          SizedBox(
            height: 5,
          ),
          Text(
            'Total Voters: 1100 voters',
            style: titleTabHeader,
          ),
        ],
      ),
    );
  }
}
