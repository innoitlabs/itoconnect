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
import 'package:i2connect/view/basewidget/custom_app_bar.dart';

class BirthdaysScreen extends StatefulWidget {
  const BirthdaysScreen({Key? key}) : super(key: key);

  @override
  BirthdaysScreenState createState() => BirthdaysScreenState();
}

class BirthdaysScreenState extends State<BirthdaysScreen> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: CustomAppBar(title: "Birthdays",),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

}