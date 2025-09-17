import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 1,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
        // fixedSize: Size.fromWidth(340),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide.none,
        ),
        backgroundColor: AppColors.green,
      ),
      child: Text(
        text,
        style:  GoogleFonts.poppins(color: AppColors.white, fontSize: 17,fontWeight: FontWeight.w600),
      ),
    );
  }
}
