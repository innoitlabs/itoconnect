import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/custom_themes.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, centerTitle: true, elevation: 0.0, leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey,), onPressed: () => Navigator.maybePop(context),), title: const Text('Groups', style: titleHeader)),
       body: Container(
        color: const Color(0xFFDFDFDF),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 14.0, right: 14.0),
          child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 14.0, mainAxisSpacing: 14.0),
              itemCount: 20,
              itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                 showModalBottomSheet(context: context, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))
                 ), builder: (context) => Container());
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const SizedBox(height: 1.0),
                  Text('Group ${index + 1}',  style: const TextStyle(
                    color: Color(0xFF046A38),
                    fontFamily: "ProximaNova",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  const Text('(25 IDs)',  style:  TextStyle(
                    color: Color(0xFF263659),
                    fontFamily: "ProximaNova",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),)
                ],),
              ),
            );
              }),
        ),
      ),
    );
  }
}
