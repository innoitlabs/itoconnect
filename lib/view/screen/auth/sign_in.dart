import 'package:flutter/material.dart';
import 'package:i2connect/util/color_resources.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/basewidget/button/custom_button.dart';
import 'package:i2connect/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:i2connect/view/basewidget/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'forgot_password.dart';
import 'sign_up.dart';
import 'package:i2connect/view/screen/dashboard/dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              Container(
                child: Text('Login', style: titleHeader),
              ),
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
                            controller: _emailController,
                          )),
                      Container(
                          margin: const EdgeInsets.only(
                              bottom: Dimensions.marginSizeSmall),
                          child: CustomPasswordTextField(
                            hintTxt: 'Enter your password',
                            textInputAction: TextInputAction.done,
                            focusNode: _passNode,
                            controller: _passwordController,
                          )),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ForgotPasswordScreen())),
                        child: Container(
                          child: Text('Forgot Password?',
                              style: titilliumSemiBold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 100, right: 100, bottom: 20, top: 30),
                        child: CustomButton(
                          buttonText: 'Sign In',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DashboardScreen())),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text("Don't have an account?",
                            style: titilliumSemiBoldGray),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpScreen())),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Sign Up',
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
      ),
    );
  }
}
