import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_picker/constants.dart';

class CustomTimePickerDialog extends StatefulWidget {
  final void Function(String formattedTime) onTimeSelected;
  final String initialTime;

  const CustomTimePickerDialog({
    Key? key,
    required this.onTimeSelected,
    required this.initialTime
  }) : super(key: key);

  @override
  State<CustomTimePickerDialog> createState() => _CustomTimePickerDialogState();
}

class _CustomTimePickerDialogState extends State<CustomTimePickerDialog> {

  final obj = Constants();
  double selectedHour = 0.0;
  double selectedMinute = 0.0;
  bool isHourSelected = true;
  String get imagePath {
    // Change the image path based on the condition
    return (selectedHour / 24) >= 0.5
      ? "assets/images/night.png"
      : "assets/images/morning.png";
  }

  // Helper function to format time
  String formatTime(double hour, double minute) {
    return "${hour.toInt()}:${minute.toInt().toString().padLeft(2, "0")}";
  }

  @override
  void initState() {
    super.initState();

    // Set the initial time based on the passed value
    if (widget.initialTime != "From" && widget.initialTime != "To") {
      List<String> initialTimeParts = widget.initialTime.split(":");
      selectedHour = double.parse(initialTimeParts[0]);
      selectedMinute = double.parse(initialTimeParts[1]);
      isHourSelected = true; // Assuming hour is initially selected
    } else {
      // Set default values or handle differently based on your requriement
      selectedHour = 0.0;
      selectedMinute = 0.0;
      isHourSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the position of the yellow container based on the selected hour
    final double containerPosition = screenWidth * 0.5 * (selectedHour / 21);

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
                      child: SizedBox(
                        height: screenWidth * 0.15,
                        width: screenWidth * 0.15,
                        child: Image.asset(imagePath)
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
                      value: isHourSelected
                        ? selectedHour
                        : selectedMinute,
                      min: isHourSelected
                        ? 0
                        : 0,
                      max: isHourSelected
                        ? 23
                        : 59,
                      onChanged: (value) {
                        setState(() {
                          if (isHourSelected) {
                            selectedHour = value;
                          } else {
                            selectedMinute = value;
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // Hour
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isHourSelected = true;
                          });
                        },
                        child: Container(
                          height: screenHeight * 0.07,
                          width: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            color: isHourSelected
                              ? Colors.white
                              : obj.lavender,
                            border: Border.all(
                              color: Colors.white
                            )
                          ),
                          child: Center(
                            child: Text(
                              "${selectedHour.toInt()}",
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
                            isHourSelected = false;
                          });
                        },
                        child: Container(
                          height: screenHeight * 0.07,
                          width: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            color: isHourSelected
                              ? obj.lavender
                              : Colors.white,
                            border: Border.all(
                              color: Colors.white
                            )
                          ),
                          child: Center(
                            child: Text(
                              selectedMinute.toInt().toString().padLeft(2, "0"),
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
                  onTap: () {
                    setState(() {
                      // Format the selected time in 24-hour format
                      String formattedTime = formatTime(
                        selectedHour,
                        selectedMinute
                      );

                      // Update the actual values upon pressing "Ok"
                      widget.onTimeSelected(formattedTime);
                      
                      Navigator.of(context).pop(); // Close the dialog box
                    });
                  },
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

