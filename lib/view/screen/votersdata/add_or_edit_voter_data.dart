import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i2connect/data/bloc/voters_data/voters_data_cubit.dart';
import 'package:i2connect/model/voters_data/voters_data_model.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';

class AddOrEditVoterDataView extends StatefulWidget {
  final bool forEdit;
  const AddOrEditVoterDataView({Key? key, required this.forEdit})
      : super(key: key);

  @override
  State<AddOrEditVoterDataView> createState() => _AddOrEditVoterDataViewState();
}

class _AddOrEditVoterDataViewState extends State<AddOrEditVoterDataView> {
  final pollingBothTextController = TextEditingController();
  final houseNoTextController = TextEditingController();
  final sectionNameTextController = TextEditingController();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final voterIdTextController = TextEditingController();
  final genderTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final mobileTextController = TextEditingController();
  final stateTextController = TextEditingController();
  final streetTextController = TextEditingController();
  final casteTextController = TextEditingController();
  final voteFavourToTextController = TextEditingController();
  final occupationTextController = TextEditingController();
  final educationTextController = TextEditingController();
  final notesTextController = TextEditingController();
  final constituencyTextController = TextEditingController();
  final mandalTextController = TextEditingController();
  final villageTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  saveData() async {
    VoterDataModel voterData = VoterDataModel();
    //   pollingBoothId: int.parse(pollingBothTextController.text),
    //   houseNoName: houseNoTextController.text,
    //   sectionName: sectionNameTextController.text,
    //   firstName: firstNameTextController.text,
    //   lastName: lastNameTextController.text,
    //   voterId: voterIdTextController.text,
    //   gender: genderTextController.text,
    //   age: int.parse(ageTextController.text),
    //   phoneNo: int.parse(mobileTextController.text),
    //   subCaste: casteTextController.text,
    //   voterType: voteFavourToTextController.text,
    //   occupation: occupationTextController.text,
    //   education: educationTextController.text,
    //   notes: notesTextController.text,
    //   constituency: constituencyTextController.text,
    //   mandal: mandalTextController.text,
    //   wardVillage: villageTextController.text,
    // );
    await BlocProvider.of<VotersDataCubit>(context)
        .saveVoterData(voterData)
        .then((value) {
      if (value) {
        Navigator.maybePop(context);
      } else {
        Fluttertoast.showToast(msg: 'Failed to add details');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
          title: Text('${!widget.forEdit ? 'New' : 'Edit'} Voter\'s Data',
              style: titleHeader)),
      body: Container(
        color: const Color(0xFFDFDFDF),
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Stack(
                //     alignment: Alignment.bottomCenter,
                //     children: [
                //       Container(
                //         height: 160.0,
                //         width: 160.0,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(4.0),
                //           border: Border.all(
                //             width: 2.0,
                //             color: const Color(0xFF99A3BE),
                //           ),
                //         ),
                //       ),
                //       Container(
                //         height: 40.0,
                //         width: 154.0,
                //         alignment: Alignment.center,
                //         margin: const EdgeInsets.only(bottom: 3.0),
                //         decoration: BoxDecoration(
                //           color: const Color(0xFFF3F7F9),
                //           borderRadius: const BorderRadius.vertical(
                //               bottom: Radius.circular(4.0)),
                //           border: Border.all(
                //             width: 2.0,
                //             color: const Color(0xFFE2E4E8),
                //           ),
                //         ),
                //         child: Text('Add Picture', style: addPictureTextStyle),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 20.0),
                const Text('Voter ID', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Voter ID',
                  controller: voterIdTextController,
                  isValidator: true,
                  validatorMessage: 'Mandatory Field',
                ),
                const SizedBox(height: 16.0),

                const Text('First Name', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter First Name',
                  controller: firstNameTextController,
                  isValidator: true,
                  validatorMessage: 'Mandatory Field',
                ),
                const SizedBox(height: 16.0),
                const Text('Last Name', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Last Name',
                  controller: lastNameTextController,
                  isValidator: true,
                  validatorMessage: 'Mandatory Field',
                ),
                const SizedBox(height: 16.0),
                const Text('Gender', style: textFieldHeader),
                const SizedBox(height: 6.0),
                DropDownTextFieldWidget(
                  controller: genderTextController,
                  items: const ['Male', 'Female', 'Others'],
                  hintText: 'Select Gender',
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        genderTextController.text = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Age', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Age',
                  controller: ageTextController,
                  isPhoneNumber: true,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                const Text('Mobile', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Mobile Number',
                  controller: mobileTextController,
                ),
                const SizedBox(height: 16.0),
                const Text('Constituency', style: textFieldHeader),
                const SizedBox(height: 6.0),
                DropDownTextFieldWidget(
                  controller: constituencyTextController,
                  items: const ['Andhra Pradesh', 'Telangana', 'Tamilnadu'],
                  hintText: 'Select Constituency',
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        constituencyTextController.text = value;
                        mandalTextController.text = '';
                        villageTextController.text = '';
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Mandal/Town', style: textFieldHeader),
                const SizedBox(height: 6.0),
                DropDownTextFieldWidget(
                  controller: mandalTextController,
                  items: const ['Andhra Pradesh', 'Telangana', 'Tamilnadu'],
                  hintText: 'Select Mandal/Town',
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        mandalTextController.text = value;
                        villageTextController.text = '';
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Ward/Village', style: textFieldHeader),
                const SizedBox(height: 6.0),
                DropDownTextFieldWidget(
                  controller: villageTextController,
                  items: const ['Andhra Pradesh', 'Telangana', 'Tamilnadu'],
                  hintText: 'Select Ward/Village',
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        villageTextController.text = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Polling Both No', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Polling Both No',
                  controller: pollingBothTextController,
                  isPhoneNumber: true,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                const Text('House No', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter House No',
                  controller: houseNoTextController,
                  isValidator: true,
                  validatorMessage: 'Mandatory Field',
                ),
                const SizedBox(height: 16.0),
                const Text('Section Name', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Section Name',
                  controller: sectionNameTextController,
                  isValidator: true,
                  validatorMessage: 'Mandatory Field',
                ),
                const SizedBox(height: 16.0),
                const Text('State', style: textFieldHeader),
                const SizedBox(height: 6.0),
                DropDownTextFieldWidget(
                  controller: stateTextController,
                  items: const ['Andhra Pradesh', 'Telangana', 'Tamilnadu'],
                  hintText: 'Select State',
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        stateTextController.text = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Street', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Street',
                  controller: streetTextController,
                ),
                const SizedBox(height: 16.0),
                const Text('Caste', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Caste',
                  controller: casteTextController,
                ),
                const SizedBox(height: 16.0),
                const Text('Vote Favour To', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Vote Favour To',
                  controller: voteFavourToTextController,
                ),
                const SizedBox(height: 16.0),
                const Text('Occupation', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Occupation',
                  controller: occupationTextController,
                ),
                const SizedBox(height: 16.0),
                const Text('Education', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Education',
                  controller: educationTextController,
                ),
                const SizedBox(height: 16.0),
                const Text('Notes', style: textFieldHeader),
                const SizedBox(height: 6.0),
                CustomTextField(
                  hintText: 'Enter Notes',
                  controller: notesTextController,
                ),

                const SizedBox(height: 30.0),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        if (voterIdTextController.text.length == 8) {
                          if (constituencyTextController.text.isNotEmpty &&
                              mandalTextController.text.isNotEmpty &&
                              villageTextController.text.isNotEmpty) {
                            saveData();
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                    'Please select Constituency, Mandal, Village');
                          }
                        } else {
                          Fluttertoast.showToast(msg: 'Please check voter Id');
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1C477A),
                          borderRadius: BorderRadius.circular(3.0)),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "ProximaNova",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0)),
                    child: const Text(
                      'Save & New',
                      style: TextStyle(
                        color: Color(0xFF1C477A),
                        fontFamily: "ProximaNova",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0)),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF1C477A),
                        fontFamily: "ProximaNova",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownTextFieldWidget extends StatelessWidget {
  const DropDownTextFieldWidget(
      {Key? key,
      required this.controller,
      this.onChanged,
      required this.hintText,
      required this.items})
      : super(key: key);

  final TextEditingController controller;
  final Function(String?)? onChanged;
  final List<String> items;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: DropdownButton<String>(
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(controller.text.isEmpty ? hintText : controller.text),
        ),
        style: titilliumRegular.copyWith(color: Theme.of(context).hintColor),
        borderRadius: BorderRadius.circular(10),
        underline: const SizedBox(),
        isExpanded: true,
        onChanged: onChanged,
      ),
    );
  }
}
