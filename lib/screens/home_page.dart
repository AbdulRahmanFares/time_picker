import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_picker/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final obj = Constants();
  DateTime fromTime = DateTime.now();
  DateTime toTime = DateTime.now();
  
  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    timePicker(bool isFromTime) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: screenHeight * 0.4,
              width: screenWidth * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: Column(
                      children: [
                        const Spacer(),

                        // Sun / Moon
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: screenWidth * 0.15,
                            width: screenWidth * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(screenWidth * 0.1)
                            )
                          )
                        ),
                        const Spacer()
                      ]
                    )
                  ),
                  Container(
                    height: screenHeight * 0.19,
                    decoration: BoxDecoration(
                      color: obj.lavender,
                      borderRadius: BorderRadius.circular(screenWidth * 0.07)
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.03
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.03,
                              child: Divider(
                                color: Colors.black54,
                                indent: screenWidth * 0.05,
                                endIndent: screenWidth * 0.05
                              )
                            ),
                            Positioned(
                              top: screenHeight * 0.003,
                              left: screenWidth * 0.05,
                              child: Container(
                                height: screenWidth * 0.05,
                                width: screenWidth * 0.05,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(screenWidth * 0.1)
                                )
                              )
                            )
                          ]
                        ),
                        SizedBox(
                          height: screenHeight * 0.03
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            // Time
                            Row(
                              children: [

                                // Hour
                                Container(
                                  height: screenHeight * 0.07,
                                  width: screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: obj.lavender
                                    )
                                  ),
                                  child: Center(
                                    child: Text(
                                      "9",
                                      style: GoogleFonts.workSans(
                                        fontSize: screenWidth * 0.06,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  )
                                ),

                                // Minutes
                                Container(
                                  height: screenHeight * 0.07,
                                  width: screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: obj.lavender
                                    )
                                  ),
                                  child: Center(
                                    child: Text(
                                      "00",
                                      style: GoogleFonts.workSans(
                                        fontSize: screenWidth * 0.055,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  )
                                )
                              ]
                            ),

                            // Periods
                            Column(
                              children: [

                                // AM
                                Container(
                                  height: screenHeight * 0.035,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: obj.lavender
                                    )
                                  ),
                                  child: Center(
                                    child: Text(
                                      "AM",
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth * 0.03,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1
                                      )
                                    )
                                  )
                                ),

                                // PM
                                Container(
                                  height: screenHeight * 0.035,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    color: obj.lavender,
                                    border: Border.all(
                                      color: obj.lavender
                                    )
                                  ),
                                  child: Center(
                                    child: Text(
                                      "PM",
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth * 0.03,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1
                                      )
                                    )
                                  )
                                )
                              ]
                            )
                          ]
                        ),
                        SizedBox(
                          height: screenHeight * 0.03
                        )
                      ]
                    )
                  ),
                  SizedBox(
                    height: screenHeight * 0.03
                  ),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // Cancel
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Close the dialog box
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            color: obj.greyShade,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1
                          )
                        )
                      ),

                      // Ok
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Ok",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            color: obj.greyShade,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1
                          )
                        )
                      )
                    ]
                  )
                ]
              )
            )
          );
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

