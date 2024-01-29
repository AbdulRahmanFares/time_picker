import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_picker/constants.dart';
import 'package:time_picker/screens/custom_time_picker_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final obj = Constants();
  
  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    timePicker(bool isFromTime) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomTimePickerDialog();
        }
      );
    }
    
    return ColorfulSafeArea(
      child: Scaffold(
        backgroundColor: obj.lavender,
        appBar: AppBar(
          backgroundColor: obj.kashmirBlue,
          title: Text(
            "TIME PICKER",
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.04,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 2
            )
          ),
          centerTitle: true
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.05),
            height: screenHeight * 0.1655,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWidth * 0.07)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please select a time range",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1
                  )
                ),
                SizedBox(
                  height: screenHeight * 0.02
                ),
            
                // Time range
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            
                    // From time
                    GestureDetector(
                      onTap: () {
                        timePicker(true);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        alignment: Alignment.centerLeft,
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.32,
                        decoration: BoxDecoration(
                          color: obj.lavender,
                          borderRadius: BorderRadius.circular(screenWidth * 0.07)
                        ),
                        child: Text(
                          "From",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1
                          )
                        )
                      )
                    ),
            
                    // To time
                    GestureDetector(
                      onTap: () {
                        timePicker(false);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        alignment: Alignment.centerLeft,
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.32,
                        decoration: BoxDecoration(
                          color: obj.lavender,
                          borderRadius: BorderRadius.circular(screenWidth * 0.07)
                        ),
                        child: Text(
                          "To",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1
                          )
                        )
                      )
                    )
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }
}

