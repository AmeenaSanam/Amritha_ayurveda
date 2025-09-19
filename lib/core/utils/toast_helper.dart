import 'package:amritha_ayurveda/core/constant/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static void showToast(String message, {bool isSuccess = true}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isSuccess ? AppColors.green : AppColors.red,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }
}
