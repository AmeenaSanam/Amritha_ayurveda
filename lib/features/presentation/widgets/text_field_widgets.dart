import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic keyboardType;                              
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  
 const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.onChanged,
  
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.black,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 13,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        filled: true,
        fillColor: AppColors.lightGrey.withValues(alpha: 0.6),  
        border: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2.0,
          color: AppColors.lightGrey,
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textBlack),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        labelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 13,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.textBlack,
          fontSize: 13,
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

 
 class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic keyboardType;                              
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  
 const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.onChanged,
  
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText=true;

  void toggle(){
    setState(() {
    _obscureText=!_obscureText;  
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.black,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 13,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        suffixIcon: GestureDetector(
          onTap: toggle,
          child: _obscureText?Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined)
        ),
        filled: true,
        fillColor: AppColors.lightGrey.withValues(alpha: 0.6),  
        border: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2.0,
          color: AppColors.lightGrey,
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textBlack),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        labelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 13,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.textBlack,
          fontSize: 13,
        ),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
    );
  }
}
