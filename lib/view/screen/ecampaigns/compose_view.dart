import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i2connect/util/custom_themes.dart';

import '../../../util/images.dart';
import '../../basewidget/textfield/custom_textfield.dart';

class ComposeView extends StatefulWidget {
  final String composeType;
  const ComposeView({Key? key, required this.composeType}) : super(key: key);

  @override
  State<ComposeView> createState() => _ComposeViewState();
}

class _ComposeViewState extends State<ComposeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text('Compose ${widget.composeType}', style: titleHeader)),
      body: Container(
        color: const Color(0xFFDFDFDF),
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20.0, top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Template', style: textFieldHeader),
              const SizedBox(height: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomTextField(
                    hintText: 'Select Template',
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(Images.expansionTileIcon),
                    )),
              ),
              const SizedBox(height: 16.0),
              const Text('Sender ID', style: textFieldHeader),
              const SizedBox(height: 8.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomTextField(
                    hintText: 'Sender ID',
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(Images.expansionTileIcon),
                    )),
              ),
              const SizedBox(height: 16.0),
              const Text('Mobile', style: textFieldHeader),
              const SizedBox(height: 8.0),
              const CustomTextField(
                hintText: 'Enter Mobile Numbers',
                maxLine: 6,
              ),
              const SizedBox(height: 16.0),
              const Text('Message', style: textFieldHeader),
              const SizedBox(height: 8.0),
              const CustomTextField(
                hintText: 'Enter Messages',
                maxLine: 6,
              ),
              const SizedBox(height: 4.0),
              const Align(
                  alignment: Alignment.topRight,
                  child: Text('Maximum 200 Characters',
                      textAlign: TextAlign.end, style: textFieldItalic)),
              const SizedBox(height: 16.0),
              const Text('Upload File', style: textFieldHeader),
              const SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 1)) // changes position of shadow
                  ],
                ),
                child: const Icon(
                  Icons.upload,
                  color: Color(0xFF1C477A),
                ),
              ),
              const SizedBox(height: 4.0),
              const Align(
                  alignment: Alignment.topRight,
                  child: Text('(png, jpg, pdf, mp4, mp3)',
                      textAlign: TextAlign.end, style: textFieldItalic)),
              const SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Schedule', style: textFieldHeader),
                  Checkbox(value: false, onChanged: (v) {})
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('From', style: textFieldSubHeader),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(
                                    0, 1)) // changes position of shadow
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xFF1C477A),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text('To', style: textFieldSubHeader),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(
                                    0, 1)) // changes position of shadow
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xFF1C477A),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  const Text('Time', style: textFieldSubHeader),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    height: 40.0,
                    width: MediaQuery.of(context).size.width * 0.3,
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 1)) // changes position of shadow
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              if (widget.composeType != 'WhatsApp')
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Allow Duplicate numbers',
                        style: textFieldHeader),
                    Checkbox(value: false, onChanged: (v) {})
                  ],
                ),
              const SizedBox(height: 8.0),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1C477A),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 1)) // changes position of shadow
                    ],
                  ),
                  child: Text('Submit', style: actionButtonStyle),
                ),
              ),
              const SizedBox(height: 40.0)
            ],
          ),
        ),
      ),
    );
  }
}
