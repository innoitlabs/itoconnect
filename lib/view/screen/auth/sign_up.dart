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
import 'sign_in.dart';
import 'package:i2connect/view/screen/dashboard/dashboard_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
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
              const SizedBox(height: 40),
              // const SizedBox(height: 90),
              Container(
                child: Text('Sign Up',
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
                                hintText: "First Name",
                                focusNode: _emailNode,
                                nextNode: _passNode,
                                textInputType: TextInputType.emailAddress,
                                controller: _emailController,
                              )),
                          Container(
                              margin:
                              const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Last Name",
                                focusNode: _emailNode,
                                nextNode: _passNode,
                                textInputType: TextInputType.emailAddress,
                                controller: _emailController,
                              )),
                          Container(
                              margin:
                              const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Email",
                                focusNode: _emailNode,
                                nextNode: _passNode,
                                textInputType: TextInputType.emailAddress,
                                controller: _emailController,
                              )),
                          Container(
                              margin:
                              const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
                              child: CustomTextField(
                                hintText: "Phone Number",
                                focusNode: _emailNode,
                                nextNode: _passNode,
                                textInputType: TextInputType.emailAddress,
                                controller: _emailController,
                              )),
                          Container(
                            margin:
                            const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.44,
                                    child: CustomTextField(
                                      hintText: "User Type",
                                      focusNode: _emailNode,
                                      nextNode: _passNode,
                                      textInputType: TextInputType.emailAddress,
                                      controller: _emailController,
                                    ),),
                                  SizedBox(width: 7,),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.44,
                                    child: CustomTextField(
                                      hintText: "State",
                                      focusNode: _emailNode,
                                      nextNode: _passNode,
                                      textInputType: TextInputType.emailAddress,
                                      controller: _emailController,
                                    ),),

                                ]),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.44,
                                    child: CustomTextField(
                                      hintText: "District",
                                      focusNode: _emailNode,
                                      nextNode: _passNode,
                                      textInputType: TextInputType.emailAddress,
                                      controller: _emailController,
                                    ),),

                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.44,
                                    child: CustomTextField(
                                      hintText: "Constituency",
                                      focusNode: _emailNode,
                                      nextNode: _passNode,
                                      textInputType: TextInputType.emailAddress,
                                      controller: _emailController,
                                    ),),

                                ]),
                          ),


                          Container(
                            margin: const EdgeInsets.only(left: 100, right: 100, bottom: 20, top: 30),
                            child: CustomButton(
                                buttonText: 'Sign Up',
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DashboardScreen())),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text("Already have an account?",
                                style: titilliumSemiBoldGray),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignInScreen())),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Login',
                                  style: titilliumSemiBoldGreenLarge),
                            ),
                          ),
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