import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {super.key,
        required this.data,
        this.fontFamily,
        this.textColor,
        this.fontWeight,
        this.fontSize,
        this.textAlign,
        this.letterSpacing,
        this.maxLines,
        this.lineHeight,});

  final String data;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? lineHeight;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: fontFamily == null
          ? TextStyle(
          fontFamily: "Geist",
          fontWeight: fontWeight ?? FontWeight.w800,
          color: textColor ?? AppColors.black,
          fontSize: fontSize ?? 16.sp,
          letterSpacing: letterSpacing ?? -0.48,
          height: lineHeight ?? 1.2)
          : TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight ?? FontWeight.w800,
          color: textColor ?? AppColors.black,
          fontSize: fontSize ?? 16.sp,
          letterSpacing: letterSpacing ?? -0.48,
          height: lineHeight ?? 1.2),
      textAlign: textAlign,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
