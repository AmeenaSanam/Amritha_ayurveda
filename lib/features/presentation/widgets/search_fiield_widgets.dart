import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search for treatments",
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey
        ),
        // labelText: "Search",
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textBlack,
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        prefixIcon: Icon(Icons.search),
        prefixIconColor: AppColors.lightGrey
      ),
      cursorColor: AppColors.lightGrey,
    );
  }
}