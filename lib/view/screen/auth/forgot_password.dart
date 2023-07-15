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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
          Provider.of<ThemeProvider>(context).darkTheme ? const SizedBox()
              : Image.asset(Images.authBackgroundImage, fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(child: Align(
                alignment: Alignment.centerLeft,
                child:
                IconButton(icon: const Icon(Icons.arrow_back_ios_outlined, color:Color(0xFF1455AC),size: 32,),
                  onPressed: () => Navigator.pop(context),
                ),
              )),
              const SizedBox(height: Dimensions.topSpace),
              const SizedBox(height: 90),
              Container(
                child: Text('Forgot Password',
                    style: titleHeader),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.marginSizeLarge),
                    child: Form(
                      key: _formKeyLogin,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                        children: [
                          Container(
                              margin:
                              const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Enter Email",
                                focusNode: _emailNode,
                                nextNode: _passNode,
                                textInputType: TextInputType.emailAddress,
                                controller: _emailController,
                              )),
                          Container(
                            margin: const EdgeInsets.only(left: 100, right: 100, bottom: 20, top: 30),
                            child: CustomButton( buttonText: 'Get OTP'),),

                          const SizedBox(width: Dimensions.paddingSizeDefault),

                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ],
      ),

    );
  }

}