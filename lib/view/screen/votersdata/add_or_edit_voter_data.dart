import 'package:flutter/material.dart';
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
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final voterIdTextController = TextEditingController();
  final genderTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final mobileTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final casteTextController = TextEditingController();
  final voteFavourToTextController = TextEditingController();
  final occupationTextController = TextEditingController();
  final educationTextController = TextEditingController();
  final notesTextController = TextEditingController();
  final constituencyTextController = TextEditingController();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 160.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xFF99A3BE),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 154.0,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 3.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F7F9),
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(4.0)),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xFFE2E4E8),
                        ),
                      ),
                      child: Text('Add Picture', style: addPictureTextStyle),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('Polling Both', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Polling Both',
                controller: pollingBothTextController,
              ),
              const SizedBox(height: 16.0),
              const Text('First Name', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter First Name',
                controller: firstNameTextController,
              ),
              const SizedBox(height: 16.0),
              const Text('Last Name', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Last Name',
                controller: lastNameTextController,
              ),
              const SizedBox(height: 16.0),
              const Text('Voter ID', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Voter ID',
                controller: voterIdTextController,
              ),
              const SizedBox(height: 16.0),
              const Text('Gender', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Gender',
                controller: genderTextController,
              ),
              const SizedBox(height: 16.0),
              const Text('Age', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Age',
                controller: ageTextController,
              ),
              const SizedBox(height: 16.0),
              const Text('Mobile', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Mobile Number',
                controller: mobileTextController,
              ),
              const SizedBox(height: 16.0),
              const Text('Address', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Address',
                controller: addressTextController,
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
              const SizedBox(height: 16.0),
              const Text('Constituency', style: textFieldHeader),
              const SizedBox(height: 6.0),
              CustomTextField(
                hintText: 'Enter Constituency',
                controller: constituencyTextController,
              ),
              const SizedBox(height: 30.0),
              Center(
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
  }
}
