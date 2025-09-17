// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:amritha_ayurveda/core/constant/app_colors.dart';
import 'package:amritha_ayurveda/features/presentation/view/home_screen.dart';
import 'package:amritha_ayurveda/features/presentation/widgets/button%20_widgets.dart';
import 'package:amritha_ayurveda/features/presentation/widgets/text_field_widgets.dart';
import 'package:amritha_ayurveda/features/presentation/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_assets.dart';
import '../view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    var size = MediaQuery.of(context).size;
    double height = size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.appBg),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Center(
                child: Image.asset(
                  AppAssets.appLogo,
                  height: height / 8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHeadText(
                        text: "Login Or Register To Book Your Appointments",
                      ),
                      SizedBox(height: 20),
                      CustomLabelText(text: "Email or Username"),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: "Enter your email  or Username",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomLabelText(text: "Password"),
                      CustomPasswordField(
                        controller: passwordController,
                        hintText: "Enter password",
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      viewmodel.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.green,
                              ),
                            )
                          : Container(
                              width: size.width,
                              child: CustomButton(
                                text: "Login",
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    await viewmodel.login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                    if (viewmodel.loginUser != null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Logged in successfully"
                                          ),
                                        ),
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            viewmodel.failures!.message
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please enter username and password",
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                      SizedBox(height: 40),
                      // Spacer(),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "By creating or logging into an account you are agreeing with our ",
                              style: TextStyle(color: AppColors.black),
                            ),
                            TextSpan(
                              text: "Terms and Conditions",
                              style: TextStyle(color: AppColors.blue),
                            ),
                            TextSpan(
                              text: " and ",
                              style: TextStyle(color: AppColors.black),
                            ),
                            TextSpan(
                              text: "Privacy Policy.",
                              style: TextStyle(color: AppColors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
