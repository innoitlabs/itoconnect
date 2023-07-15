import 'package:flutter/material.dart';
import 'package:i2connect/util/custom_themes.dart';
import 'package:i2connect/util/dimensions.dart';

class BlueButton extends StatelessWidget {
  final Function? onTap;
  final String? buttonText;
  final bool isBuy;
  final bool isBorder;
  final Color? backgroundColor;
  final double? radius;
  final double? width;
  final double? height;
  const BlueButton({Key? key, this.onTap, required this.buttonText, this.isBuy= false, this.isBorder = false, this.backgroundColor, this.radius, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap as void Function()?,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:  Color(0xFF528BB8),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: const Offset(0, 1)), // changes position of shadow
            ],
            borderRadius: BorderRadius.circular(radius !=null ? radius! : isBorder? Dimensions.paddingSizeExtraSmall : Dimensions.paddingSizeSmall)),
        child: Text(buttonText!,
            style: titilliumSemiBold.copyWith(
              fontSize: 20,
              color: Theme.of(context).highlightColor,
            )),
      ),
    );
  }
}
