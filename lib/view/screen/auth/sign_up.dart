import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/auth/auth_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:i2connect/model/signin/constituency/constituency_model.dart';
import 'package:i2connect/model/signin/districts/districts_model.dart';
import 'package:i2connect/model/signin/states_roles/states_roles_model.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/button/custom_button.dart';
import 'package:i2connect/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
import 'package:i2connect/view/screen/auth/otp.dart';
import 'package:provider/provider.dart';
import 'sign_in.dart';
import 'package:i2connect/view/screen/dashboard/dashboard_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final formKeySignUp = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userTypeController = TextEditingController();
  final stateController = TextEditingController();
  final districtController = TextEditingController();
  final constiuencyController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).getDropdownRolesAndStates();
    super.initState();
  }

  var dropdownvalue;

  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();

    emailController.dispose();
    phoneNumberController.dispose();
    userTypeController.dispose();
    stateController.dispose();
    districtController.dispose();
    constiuencyController.dispose();

    super.dispose();
  }

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              Provider.of<ThemeProvider>(context).darkTheme
                  ? const SizedBox()
                  : Image.asset(Images.authBackgroundImage,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SafeArea(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Color(0xFF1455AC),
                        size: 32,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )),
                  const SizedBox(height: 40),
                  // const SizedBox(height: 90),
                  Container(
                    child: Text('Sign Up', style: titleHeader),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.marginSizeLarge),
                    child: Form(
                      key: formKeySignUp,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeSmall),
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "First Name",
                                textInputType: TextInputType.emailAddress,
                                controller: firstNameController,
                                isValidator: true,
                                validatorMessage: 'Mandatory',
                              )),
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Last Name",
                                textInputType: TextInputType.emailAddress,
                                controller: lastNameController,
                                isValidator: true,
                                validatorMessage: 'Mandatory',
                              )),
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Email",
                                textInputType: TextInputType.emailAddress,
                                controller: emailController,
                                isValidator: true,
                                validatorMessage: 'Mandatory',
                              )),
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Phone Number",
                                textInputType: TextInputType.emailAddress,
                                isPhoneNumber: true,
                                controller: phoneNumberController,
                                isValidator: true,
                                validatorMessage: 'Mandatory',
                              )),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: Dimensions.marginSizeSmall),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(
                                          left: 14.0, right: 4.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).highlightColor,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0,
                                                  1)) // changes position of shadow
                                        ],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<RoleModel>(
                                            hint: Text(
                                              state.selectedRole.role_name ??
                                                  'User Type',
                                              style: titilliumRegular.copyWith(
                                                  color: state.selectedRole
                                                              .role_name !=
                                                          null
                                                      ? Colors.black87
                                                      : Theme.of(context)
                                                          .hintColor),
                                            ),
                                            items: state.statesAndRoles.roles
                                                ?.map((RoleModel item) {
                                              return DropdownMenuItem<
                                                  RoleModel>(
                                                value: item,
                                                child: Text(
                                                    item.role_name.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (RoleModel? role) {
                                              if (role != null) {
                                                BlocProvider.of<AuthCubit>(
                                                        context)
                                                    .updateRole(role);
                                              }
                                            },
                                            value: dropdownvalue),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(
                                          left: 14.0, right: 4.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).highlightColor,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0, 1))
                                        ],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<StateModel>(
                                          hint: Text(
                                            state.selectedState.state_name ??
                                                'Select State',
                                            overflow: TextOverflow.ellipsis,
                                            style: titilliumRegular.copyWith(
                                                color: state.selectedRole
                                                            .role_name !=
                                                        null
                                                    ? Colors.black87
                                                    : Theme.of(context)
                                                        .hintColor),
                                          ),
                                          items: state.statesAndRoles.states
                                              ?.map((item) {
                                            return DropdownMenuItem<StateModel>(
                                              value: item,
                                              child: Text(
                                                  item.state_name.toString()),
                                            );
                                          }).toList(),
                                          onChanged: (StateModel? state) {
                                            if (state != null) {
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .updateState(state);
                                            }
                                          },
                                          value: dropdownvalue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: Dimensions.marginSizeSmall),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(
                                          left: 14.0, right: 4.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).highlightColor,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0, 1))
                                        ],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<DistrictModel>(
                                          hint: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            child: Text(
                                              state.selectedDistrict
                                                      .dist_name ??
                                                  'Select District',
                                              overflow: TextOverflow.ellipsis,
                                              style: titilliumRegular.copyWith(
                                                  color: state.selectedDistrict
                                                              .dist_name !=
                                                          null
                                                      ? Colors.black87
                                                      : Theme.of(context)
                                                          .hintColor),
                                            ),
                                          ),
                                          items:
                                              state.districtsList.map((item) {
                                            return DropdownMenuItem<
                                                DistrictModel>(
                                              value: item,
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                                child: Text(
                                                    item.dist_name.toString()),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (DistrictModel? district) {
                                            if (district != null) {
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .updateDistrict(district);
                                            }
                                          },
                                          value: dropdownvalue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(
                                          left: 14.0, right: 4.0),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).highlightColor,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0, 1))
                                        ],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child:
                                            DropdownButton<ConstituencyModel>(
                                          hint: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            child: Text(
                                              state.selectedConstituency
                                                      .mla_constituency_name ??
                                                  'Constituency',
                                              overflow: TextOverflow.ellipsis,
                                              style: titilliumRegular.copyWith(
                                                  color: state.selectedDistrict
                                                              .dist_name !=
                                                          null
                                                      ? Colors.black87
                                                      : Theme.of(context)
                                                          .hintColor),
                                            ),
                                          ),
                                          items: state.constituenciesList
                                              .map((item) {
                                            return DropdownMenuItem<
                                                ConstituencyModel>(
                                              value: item,
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                                child: Text(item
                                                    .mla_constituency_name
                                                    .toString()),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (ConstituencyModel?
                                              constituency) {
                                            if (constituency != null) {
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .updateConstituency(
                                                      constituency);
                                            }
                                          },
                                          value: dropdownvalue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 100, right: 100, bottom: 20, top: 30),
                            child: state.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  )
                                : CustomButton(
                                    buttonText: 'Sign Up',
                                    onTap: () {
                                      if (formKeySignUp.currentState!
                                          .validate()) {
                                        BlocProvider.of<AuthCubit>(context)
                                            .onClickSignUp(
                                          email: emailController.text,
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          phone: phoneNumberController.text,
                                        )
                                            .then((value) {
                                          if (value) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => OTPView(
                                                    email:
                                                        emailController.text),
                                              ),
                                            );
                                          }
                                        });
                                      }
                                    },
                                  ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text("Already have an account?",
                                style: titilliumSemiBoldGray),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignInScreen())),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text('SignIn',
                                  style: titilliumSemiBoldGreenLarge),
                            ),
                          ),
                          const SizedBox(width: Dimensions.paddingSizeDefault),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
