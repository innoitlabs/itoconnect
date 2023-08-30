import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/auth/auth_cubit.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/button/custom_button.dart';
import 'package:i2connect/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
import 'package:i2connect/view/screen/mainscreen/mainscreen.dart';
import 'package:provider/provider.dart';
import 'forgot_password.dart';
import 'sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKeyLogin = GlobalKey<FormState>();

  @override
  void initState() {
    emailController.text = 'k.pavankumaar@gmail.com';
    passwordController.text = 'Pavan@123';
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
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
                  const SizedBox(height: Dimensions.topSpace),
                  Image.asset(Images.i2connectLogoGoldImage,
                      height: 100, width: 200),
                  Image.asset(
                    Images.i2connectLogoTitleImage,
                    height: 20,
                    width: 100,
                  ),
                  const SizedBox(height: 50),
                  const Text('Login', style: titleHeader),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.marginSizeLarge),
                    child: Form(
                      key: _formKeyLogin,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeSmall),
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Enter your Email Id",
                                focusNode: _emailNode,
                                nextNode: _passNode,
                                textInputType: TextInputType.emailAddress,
                                controller: emailController,
                              )),
                          Container(
                              margin: const EdgeInsets.only(
                                  bottom: Dimensions.marginSizeSmall),
                              child: CustomPasswordTextField(
                                hintTxt: 'Enter your password',
                                textInputAction: TextInputAction.done,
                                focusNode: _passNode,
                                controller: passwordController,
                              )),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const ForgotPasswordScreen())),
                            child: const Text('Forgot Password?',
                                style: titilliumSemiBold),
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
                                    buttonText: 'Sign In',
                                    onTap: () async {
                                      await BlocProvider.of<AuthCubit>(context)
                                          .onClickSignIn(
                                              email: emailController.text,
                                              password: passwordController.text)
                                          .then((value) {
                                        if (value) {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainScreenView(),
                                              ),
                                              (route) => false);
                                        }
                                      });
                                    },
                                  ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text("Don't have an account?",
                                style: titilliumSemiBoldGray),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text('Sign Up',
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
