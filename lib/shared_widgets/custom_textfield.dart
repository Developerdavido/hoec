import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool expandable;
  final VoidCallback? onTap;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool defaultValidation;

  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.expandable = false,
    this.onTap,
    this.hintText,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.inputFormatters,
    this.validator,
    this.defaultValidation = true,
  });

  @override
  Widget build(BuildContext context) {
    final _focusNode = FocusNode();

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.r),
      borderSide: const BorderSide(
        color: AppColors.borderColor,
        width: 0.5,
      ),
    );

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: _focusNode,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: expandable ? 5 : 1,
      minLines: expandable ? 1 : null,
      onTap: onTap,
      style: TextStyle(
        fontSize: 14,
        fontFamily: "Geist",
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.48,
        height: 1.2,
      ),
      cursorColor: AppColors.black,
      onTapOutside: (_) => _focusNode.unfocus(),
      decoration: InputDecoration(
        border: border,
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
            width: 0.5,
          ),
        ),
        hintText: hintText,
        labelText: null,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 0.5,
          ),
        ),
        errorStyle: TextStyle(
          fontSize: 14,
          fontFamily: "Geist",
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.48,
          height: 1.2,
        ),
        labelStyle: TextStyle(
          fontSize: 14,
          fontFamily: "Geist",
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.48,
          height: 1.2,
        ),
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          fontSize: 14,
          fontFamily: "Geist",
          color: AppColors.hintColor,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.48,
          height: 1.2,
        ),
        prefix: prefix,
        prefixIcon: prefixIcon,
        //contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      inputFormatters: inputFormatters,
      validator: defaultValidation
          ? (value) {
        if (value == null || value.isEmpty) {
          return 'Required Field';
        }
        return validator?.call(value);
      }
          : validator,
    );
  }
}