import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/auth/auth_cubit.dart';
import 'package:i2connect/model/signin/signin_response_model.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/button/custom_button.dart';
import 'package:i2connect/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
import 'package:i2connect/view/screen/auth/sign_in.dart';
import 'package:provider/provider.dart';
import 'forgot_password.dart';
import 'sign_up.dart';

class OTPView extends StatefulWidget {
  final String email;
  const OTPView({Key? key, required this.email}) : super(key: key);

  @override
  OTPViewState createState() => OTPViewState();
}

class OTPViewState extends State<OTPView> {
  final otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

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
                  const SizedBox(height: Dimensions.topSpace),
                  const SizedBox(height: 90),
                  const Text('Enter OTP', style: titleHeader),
                  const SizedBox(height: 20),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.marginSizeLarge),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeSmall),
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                bottom: Dimensions.marginSizeSmall),
                            child: CustomTextField(
                              hintText: "Enter OTP",
                              textInputType: TextInputType.emailAddress,
                              controller: otpController,
                            )),
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
                                  buttonText: 'Verify OTP',
                                  onTap: () async {
                                    await BlocProvider.of<AuthCubit>(context)
                                        .onClickVerifyOTP(
                                            email: widget.email,
                                            otp: otpController.text)
                                        .then((value) {
                                      if (value) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignInScreen()),
                                            (route) => false);
                                      }
                                    });
                                  },
                                ),
                        ),
                        const SizedBox(width: Dimensions.paddingSizeDefault),
                      ],
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
