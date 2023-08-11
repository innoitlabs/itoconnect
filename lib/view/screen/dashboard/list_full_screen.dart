import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/custom_app_bar.dart';
import 'package:i2connect/view/screen/dashboard/widgets/important_people.dart';
import 'package:i2connect/view/screen/dashboard/widgets/ward_issues.dart';
import 'package:i2connect/view/screen/dashboard/widgets/todo_list.dart';

class ListFullScreen extends StatefulWidget {
  final String screenType;
  const ListFullScreen({Key? key, this.screenType = ''}) : super(key: key);

  @override
  ListFullScreenState createState() => ListFullScreenState();
}

class ListFullScreenState extends State<ListFullScreen> {

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
      body: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: CustomAppBar(title: "",),
              ),
              Container(
                padding:
                EdgeInsets.only(left: 20, right: 20, top: 10),
                child: widget.screenType == 'ImportantPeople' ? ImportantPeople(isDashboard: false) : WardIssues(isDashboard: false),
              ),
            ],
          ),
        ],
      ),
    );
  }

}