import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i2connect/data/bloc/voters_data/voters_data_cubit.dart';
import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';
import '../../../model/voters_data/voters_data_model.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';

class AddOrEditVoterDataView extends StatefulWidget {
  final bool forEdit;
  final VoterDataModel editVoter;
  const AddOrEditVoterDataView({Key? key, required this.forEdit, required this.editVoter})
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
  int selectedConstituencyId = 0;
  int selectedMandalId = 0;
  int selectedWardVillageId = 0;
  int selectedState = 0;
  int selectedPollingId = 0;


  @override
  void initState() {
    BlocProvider.of<VotersDataCubit>(context).initialize();
    if(widget.forEdit){
      loadEditData();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadEditData() async {
    VoterDataModel editVoterData = widget.editVoter;
    voterIdTextController.text = editVoterData.voterId.toString();
    firstNameTextController.text = editVoterData.firstName!;
    lastNameTextController.text = editVoterData.lastName!;
    genderTextController.text = editVoterData.gender!;
    ageTextController.text = editVoterData.age.toString();
    mobileTextController.text = editVoterData.phoneNo.toString();
    houseNoTextController.text = editVoterData.houseNoName!;
    sectionNameTextController.text = editVoterData.sectionName!;
    streetTextController.text = editVoterData.street!;
    selectedConstituencyId = editVoterData.constituency!;
    selectedMandalId = editVoterData.mandal!;
    selectedWardVillageId = editVoterData.wardVillage!;
    selectedState = editVoterData.state!;
  }

  saveData() async {
    //VoterDataModel voterData = VoterDataModel();
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

    VoterDataModel voterData = VoterDataModel(
      voterId: voterIdTextController.text,
      firstName: firstNameTextController.text,
      lastName: lastNameTextController.text,
      gender: genderTextController.text,
      age: int.parse(ageTextController.text),
      phoneNo: int.parse(mobileTextController.text),
      constituency: selectedConstituencyId,
      mandal: selectedMandalId,
      wardVillage: selectedWardVillageId,
      pollingBooth: selectedPollingId,
      houseNoName: houseNoTextController.text,
      sectionName: sectionNameTextController.text,
      state: selectedState,
      street: streetTextController.text,
    );
    if(widget.forEdit){
      await BlocProvider.of<VotersDataCubit>(context)
          .updateVoterData(voterData)
          .then((value) {
        if (value) {
          Fluttertoast.showToast(msg: 'Voter saved successfully');
          Navigator.maybePop(context);
        } else {
          Fluttertoast.showToast(msg: 'Failed to add details');
        }
      });
    }
    else{
      await BlocProvider.of<VotersDataCubit>(context)
          .saveVoterData(voterData)
          .then((value) {
        if (value) {
          Fluttertoast.showToast(msg: 'Voter saved successfully');
          Navigator.maybePop(context);
        } else {
          Fluttertoast.showToast(msg: 'Failed to add details');
        }
      });
    }
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
      body: BlocConsumer<VotersDataCubit, VotersDataState>(
        buildWhen: (previous, current) => previous != current,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // String constituencyTitle =
          // getConstituencyTitle(state.selectedConstituencies);
          // String mandalTitle = getMandalTitle(state.selectedMandal);
          // String villageTitle = getVillageTitle(state.selectedVillages);
          // String pollingTitle = getPollingTitle(state.selectedPollings);

          if(widget.forEdit){
             DropdownConstituencyModel editConstuency = state.dropdownDetails.constituencies!.firstWhere((constituency) => constituency.constituency_id == widget.editVoter!.constituency);
             constituencyTextController.text = editConstuency.mp_constituency_name! ?? "";

            MandalModel editMandal = state.dropdownDetails.mandal!.firstWhere((mandal) => mandal.mandal_id == widget.editVoter!.mandal);
            mandalTextController.text = editMandal.mandal_name! ?? "";

            VillageModal editVillage = state.dropdownDetails.villages!.firstWhere((village) => village.ward_village_id == widget.editVoter!.wardVillage);
            villageTextController.text = editVillage.ward_village_name! ?? "";

            PollingModel editPolling = state.dropdownDetails.polling!.firstWhere((polling) => polling.polling_booth_id == widget.editVoter!.pollingBooth);
            pollingBothTextController.text = editPolling.polling_booth_no.toString()! ?? "";
          }

          return Container(
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
                      items: state.dropdownDetails.constituencies!.map<String>((DropdownConstituencyModel constituency) => constituency.mp_constituency_name!).toList(),
                      hintText: 'Select Constituency',
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            DropdownConstituencyModel selectedConstitute = state.dropdownDetails.constituencies!.firstWhere((constituency) => constituency.mp_constituency_name == value);
                            selectedConstituencyId = selectedConstitute.constituency_id!;
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
                      items: state.dropdownDetails.mandal!.map<String>((MandalModel mandal) => mandal.mandal_name!).toList(),
                      hintText: 'Select Mandal/Town',
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            MandalModel selectedMandal = state.dropdownDetails.mandal!.firstWhere((mandal) => mandal.mandal_name == value);
                            selectedMandalId = selectedMandal.mandal_id!;
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
                      items: state.dropdownDetails.villages!.map<String>((VillageModal village) => village.ward_village_name!).toList(),
                      hintText: 'Select Ward/Village',
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            VillageModal selectedVillage = state.dropdownDetails.villages!.firstWhere((village) => village.ward_village_name == value);
                            selectedWardVillageId = selectedVillage.ward_village_id!;
                            villageTextController.text = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text('Polling Both No', style: textFieldHeader),
                    const SizedBox(height: 6.0),
                    DropDownTextFieldWidget(
                      controller: pollingBothTextController,
                      items: state.dropdownDetails.polling!.map<String>((PollingModel polling) => polling.polling_booth_no.toString()).toList(),
                      hintText: 'Select Polling Booth',
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            PollingModel selectedPolling = state.dropdownDetails.polling!.firstWhere((polling) => polling.polling_booth_no.toString() == value);
                            selectedPollingId = selectedPolling.polling_booth_id!;
                            pollingBothTextController.text = value;
                          });
                        }
                      },
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
                            selectedState = value == 'Andhra Pradesh' ? 1 : value == 'Telangana' ? 2 : 3;
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
                            if (voterIdTextController.text.length >= 8) {
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
          );
        },
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
