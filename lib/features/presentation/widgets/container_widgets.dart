import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/app_colors.dart';

class PatientListContainer extends StatelessWidget {
  final int index;
  final String name;
  final String treatment;
  final String date;
  final String drName;

  const PatientListContainer({
    super.key,
    required this.index,
    required this.name,
    required this.treatment,
    required this.date,
    required this.drName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.lightGrey.withValues(alpha: 0.2),
      ),
      child: Column(
        children: [
          ListTile(
            minLeadingWidth: 5,
            isThreeLine: true,
            leading: Text(
              "${(index + 1).toString()}.",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            title: Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  treatment,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColors.green,
                  ),
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.red,
                      size: 12,
                    ),
                    SizedBox(width: 5),
                    Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.group_outlined, color: AppColors.red, size: 14),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        drName,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 10, thickness: 1, color: AppColors.lightGrey),
          ListTile(
            leading: Text(""),
            title: Text(
              "View Booking details",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.green,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
