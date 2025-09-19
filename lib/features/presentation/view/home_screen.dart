import 'package:amritha_ayurveda/core/constant/app_assets.dart';
import 'package:amritha_ayurveda/core/constant/app_colors.dart';
import 'package:amritha_ayurveda/features/presentation/widgets/button%20_widgets.dart';
import 'package:amritha_ayurveda/features/presentation/widgets/container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../view_model/patient_viewmodel.dart';
import '../widgets/date_picker_widgets.dart';
import '../widgets/search_fiield_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<PatientViewmodel>(context, listen: false).fetchPatients(),
    );
  }

  TextEditingController dateController = TextEditingController();

  String toFormattedDate(pickedDate) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter
        .format(pickedDate)
        .toString()
        .replaceFirstMapped("00:00:00.000", (match) => "");
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Badge(
            alignment: Alignment(0.15, -0.3),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined),
            ),
          ),
        ],
      ),
      body: Consumer<PatientViewmodel>(
        builder: (context, provider, _) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: CustomSearchField()),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.green,
                          foregroundColor: AppColors.white,
                        ),
                        child: Text(
                          "Search",
                          style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //  SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: AppColors.lightGrey),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Sort by :",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      // flex: 1,
                      child: CustomDatePicker(
                        controller: dateController,
                        hintText: "Date",
                        labelText: "Date",
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2200),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: provider.fetchPatients,
                child: Container(
                  height: size.height - kToolbarHeight - 200,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: provider.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : provider.patients.isEmpty
                      ? Center(child: Image.asset(AppAssets.noData))
                      : ListView.builder(
                          itemCount: provider.patients.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final patient = provider.patients[index];
                            return PatientListContainer(
                              index: index,
                              name: patient.name,
                              treatment: patient.treatment ?? "-",
                              date: toFormattedDate(
                                patient.dateTime ?? DateTime.now(),
                              ),
                              drName: patient.user ?? "-",
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: size.width,
        child: CustomButton(text: "Register", onPressed: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
