import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_picker/constants.dart';

class CustomTimePickerDialog extends StatefulWidget {
  const CustomTimePickerDialog({super.key});

  @override
  State<CustomTimePickerDialog> createState() => _CustomTimePickerDialogState();
}

class _CustomTimePickerDialogState extends State<CustomTimePickerDialog> {

  final obj = Constants();
  double selectedHourForFromTime = 1.0;
  double selectedMinuteForFromTime = 0.0;
  bool isHourSelectedForFromTime = true;
  bool isAMSelected = true; // To track AM / PM selection

  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the position of the yellow container based on the selected hour
    final double containerPosition = screenWidth * 0.5 * (selectedHourForFromTime / 12.0);

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
                    alignment: Alignment.centerLeft,
                    child: Transform.translate(
                      offset: Offset(containerPosition, 0),
                      child: Container(
                        height: screenWidth * 0.15,
                        width: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(screenWidth * 0.1)
                        )
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
                  
                  // Slider
                  SizedBox(
                    height: screenHeight * 0.03,
                    child: Slider(
                      thumbColor: obj.kashmirBlue,
                      activeColor: Colors.grey,
                      inactiveColor: Colors.white,
                      value: isHourSelectedForFromTime
                        ? selectedHourForFromTime
                        : selectedMinuteForFromTime,
                      min: isHourSelectedForFromTime
                        ? 1
                        : 0,
                      max: isHourSelectedForFromTime
                        ? 12
                        : 59,
                      onChanged: (value) {
                        setState(() {
                          if (isHourSelectedForFromTime) {
                            selectedHourForFromTime = value;
                          } else {
                            selectedMinuteForFromTime = value;
                          }
                        });
                      }
                    )
                  ),
                  SizedBox(
                    height: screenHeight * 0.03
                  ),

                  // Display selected time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      // Time
                      Row(
                        children: [

                          // Hour
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isHourSelectedForFromTime = true;
                              });
                            },
                            child: Container(
                              height: screenHeight * 0.07,
                              width: screenWidth * 0.15,
                              decoration: BoxDecoration(
                                color: isHourSelectedForFromTime
                                  ? Colors.white
                                  : obj.lavender,
                                border: Border.all(
                                  color: Colors.white
                                )
                              ),
                              child: Center(
                                child: Text(
                                  "${selectedHourForFromTime.toInt()}",
                                  style: GoogleFonts.workSans(
                                    fontSize: screenWidth * 0.06,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              )
                            )
                          ),

                          // Minutes
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isHourSelectedForFromTime = false;
                              });
                            },
                            child: Container(
                              height: screenHeight * 0.07,
                              width: screenWidth * 0.15,
                              decoration: BoxDecoration(
                                color: isHourSelectedForFromTime
                                  ? obj.lavender
                                  : Colors.white,
                                border: Border.all(
                                  color: Colors.white
                                )
                              ),
                              child: Center(
                                child: Text(
                                  selectedMinuteForFromTime.toInt().toString().padLeft(2, "0"),
                                  style: GoogleFonts.workSans(
                                    fontSize: screenWidth * 0.055,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold
                                  )
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isAMSelected = true;
                              });
                            },
                            child: Container(
                              height: screenHeight * 0.035,
                              width: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                color: isAMSelected
                                  ? Colors.white
                                  : obj.lavender,
                                border: Border.all(
                                  color: Colors.white
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
                            )
                          ),

                          // PM
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isAMSelected = false;
                              });
                            },
                            child: Container(
                              height: screenHeight * 0.035,
                              width: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                color: isAMSelected
                                  ? obj.lavender
                                  : Colors.white,
                                border: Border.all(
                                  color: Colors.white
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
}

