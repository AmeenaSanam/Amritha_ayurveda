import 'package:amritha_ayurveda/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeadText extends StatelessWidget {
  final String text;
  const CustomHeadText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: AppColors.textBlack,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
    );
  }
}

class CustomLabelText extends StatelessWidget {
  final String text;
  const CustomLabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5.0 ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: AppColors.textBlack,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
