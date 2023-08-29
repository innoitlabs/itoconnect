import 'package:flutter/material.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/dimensions.dart';
import 'package:i2connect/util/images.dart';
import 'package:i2connect/view/screen/auth/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool isBackButtonExist;
  final Widget? action;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.isBackButtonExist = true,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: 60,
        alignment: Alignment.center,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 32,
                ),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                alignment: Alignment.center,
                child: Text(title!, style: titleHeader),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: action,
            ),
          ],
        ),

        // Row(children: [
        //
        //   isBackButtonExist ? IconButton(
        //     icon: Icon(Icons.arrow_back_ios, size: 20,
        //         color: Provider.of<ThemeProvider>(context).darkTheme ? Colors.white : Colors.black),
        //     onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.of(context).pop(),
        //   ) : const SizedBox.shrink(),
        //   const SizedBox(width: Dimensions.paddingSizeSmall),
        //
        //   Expanded(
        //     child: Text(
        //       title!, style: titilliumRegular.copyWith(fontSize: 20,
        //       color: Provider.of<ThemeProvider>(context).darkTheme ? Colors.white : Colors.black,),
        //       maxLines: 1, overflow: TextOverflow.ellipsis,
        //     ),
        //   ),
        //
        //   icon != null ? IconButton(
        //     icon: Icon(icon, size: Dimensions.iconSizeLarge, color: Colors.white),
        //     onPressed: onActionPressed as void Function()?,
        //   ) : const SizedBox.shrink(),
        //
        // ]),
      ),
    ]);
  }
}
