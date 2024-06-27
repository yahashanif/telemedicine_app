import 'package:flutter/material.dart';

import '../app/constant.dart';
import '../app/theme.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Color textColor;
  final double paddingVertical;
  // final double width;
  final Function()? onPressed;
  final double fontTextSize;
  final double marginBottom;
  final double marginTop;
  final FontWeight fontWeight;

  const CustomSmallButton({
    super.key,
    required this.text,
    this.buttonColor = primaryMainColor,
    this.textColor = primaryMainColor,
    // this.width = double.maxFinite,
    required this.onPressed,
    this.fontTextSize = 15,
    this.marginBottom = 0,
    this.paddingVertical = 11,
    this.marginTop = 0,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      child: InkWell(
        highlightColor: primaryMainColor.withOpacity(0.1),
        splashColor: primaryMainColor.withOpacity(0.1),
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
            decoration: BoxDecoration(
                color: buttonColor,
                border: Border.all(color: primaryMainColor),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(
                horizontal: getActualX(context: context, x: 10),
                vertical: getActualY(context: context, y: 4)),
            child: Center(
              child: Text(
                text,
                style: textMediumMedium(context: context).copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: getActualY(context: context, y: 13)),
              ),
            )),
      ),
    );
  }
}
