import 'package:flutter/material.dart';
import '../core/constants/dimensions.dart';
import '../core/constants/font_weight.dart';
import '../core/constants/palette.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.fontWeight,
    required this.font,
     this.onPress,
    this.buttonColor,
    this.width,
    this.height,
  }) : super(key: key);

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double font;
  final Function()? onPress;
  final Color? buttonColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: height ?? 55,
        width: width,
        child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(buttonColor ?? AppColors.blue),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius_10)),
            ),
            elevation: MaterialStatePropertyAll(0),
          ),
          child: CustomText(
            textAlign: TextAlign.center,
            text: text,
            color1: color,
            fontWeight: fontWeight,
            fontSize: font,
            height: height_0,
          ),
        ),
      ),
    );
  }
}


