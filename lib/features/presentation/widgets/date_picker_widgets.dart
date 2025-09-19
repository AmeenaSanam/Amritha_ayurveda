import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/app_colors.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final void Function()? onTap;

  const CustomDatePicker({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        iconColor: AppColors.black,
        labelStyle:  GoogleFonts.poppins(
          color: AppColors.textBlack,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        labelText: labelText,
        hintText: "Date",
        suffixIcon: const Icon(
          Icons.arrow_drop_down,
          size: 20,
        ),
        border: const OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
      ),
      readOnly: true,
      onTap: onTap,
    );
  }
}
