import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i2connect/util/custom_themes.dart';

import '../../basewidget/textfield/custom_textfield.dart';

class NewGroupView extends StatefulWidget {
  const NewGroupView({Key? key}) : super(key: key);

  @override
  State<NewGroupView> createState() => _NewGroupViewState();
}

class _NewGroupViewState extends State<NewGroupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, centerTitle: true, elevation: 0.0, leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey,), onPressed: () => Navigator.maybePop(context),), title: const Text('New Group', style: titleHeader)),
      body: Container(
        color: const Color(0xFFDFDFDF),
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Group Name', style: textFieldHeader),
            const SizedBox(height: 10.0),
            CustomTextField(
              hintText: 'Enter Group Name',
            ),
            const SizedBox(height: 20.0),
            Text('Description', style: textFieldHeader),
            const SizedBox(height: 10.0),
            CustomTextField(
              hintText: 'Enter Description',
            ),
            const SizedBox(height: 20.0),
            CustomTextField(
              hintText: 'Add Members',
              suffix: Container(
                margin: const EdgeInsets.only(right: 10.0),
                  decoration: const BoxDecoration(color: Color(0xFF1C477A), shape: BoxShape.circle),  child: Icon(Icons.add, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
