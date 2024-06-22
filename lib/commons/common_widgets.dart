import 'package:flutter/material.dart';

import '../commons/ui_helpers.dart';
import '../config/microsoft/microsoft_auth.dart';
import '../config/microsoft/microsoft_functions.dart';

// Future<void> selectDate(BuildContext context, DateTime currDate) async {
//   final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//             data: Theme.of(context).copyWith(
//                 colorScheme: ColorScheme.fromSwatch(
//                   primarySwatch: const MaterialColor(0XFF0d0d0d, {
//                     50: Color(0xFF979797),
//                     100: Color(0xFF868686),
//                     200: Color(0xFF757575),
//                     300: Color(0xFF636363),
//                     400: Color(0xFF525252),
//                     500: Color(0xFF414141),
//                     600: Color(0xFF2F2F2F),
//                     700: Color(0xFF1E1E1E),
//                     800: Color(0XFF0d0d0d),
//                   }),
//                   brightness: Brightness.dark,
//                   accentColor: const Color(0XFF800000),
//                   cardColor: const Color(0XFF0d0d0d),
//                 ),
//                 datePickerTheme: const DatePickerThemeData(
//                   headerBackgroundColor: Color(0XFF800000),
//                   dayOverlayColor: MaterialStatePropertyAll(
//                     Color(0XFF800000),
//                   ),
//                   todayBackgroundColor:
//                       MaterialStatePropertyAll(Color(0XFF800000)),
//                   yearOverlayColor: MaterialStatePropertyAll(
//                     Color(0XFF800000),
//                   ),
//                   rangePickerBackgroundColor: Color(0XFF800000),
//                   rangePickerSurfaceTintColor: Color(0XFFFFFFFF),
//                   dividerColor: Color(0XFF800000),
//                   headerHeadlineStyle: TextStyle(
//                     fontFamily: 'GlacialIndifference',
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.2,
//                     color: Color(0XFFFFFFFF),
//                   ),
//                   headerHelpStyle: TextStyle(
//                     fontFamily: 'GlacialIndifference',
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.2,
//                     color: Color(0XFFFFFFFF),
//                   ),
//                   yearStyle: TextStyle(
//                     fontFamily: 'GlacialIndifference',
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.2,
//                     color: Color(0XFFFFFFFF),
//                   ),
//                   weekdayStyle: TextStyle(
//                     fontFamily: 'GlacialIndifference',
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.2,
//                     color: Color(0XFFFFFFFF),
//                   ),
//                   dayStyle: TextStyle(
//                     fontFamily: 'GlacialIndifference',
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.2,
//                     color: Color(0XFFFFFFFF),
//                   ),
//                   cancelButtonStyle: ButtonStyle(
//                     backgroundColor:
//                         MaterialStatePropertyAll(Color(0XFF202020)),
//                     foregroundColor: MaterialStatePropertyAll(Colors.white),
//                     textStyle: MaterialStatePropertyAll(
//                       TextStyle(
//                         fontFamily: 'GlacialIndifference',
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   confirmButtonStyle: ButtonStyle(
//                     backgroundColor:
//                         MaterialStatePropertyAll(Color(0XFF202020)),
//                     foregroundColor: MaterialStatePropertyAll(Colors.white),
//                     textStyle: MaterialStatePropertyAll(
//                       TextStyle(
//                         fontFamily: 'GlacialIndifference',
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   rangePickerHeaderHeadlineStyle: TextStyle(
//                     fontFamily: 'GlacialIndifference',
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.2,
//                     color: Color(0XFFFFFFFF),
//                   ),
//                   rangePickerHeaderHelpStyle: TextStyle(
//                     fontFamily: 'GlacialIndifference',
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.2,
//                     color: Color(0XFFFFFFFF),
//                   ),
//                 )),
//             child: child!);
//       });
//   if (picked != null && picked != currDate) {
//     dateTimeController.displayDate.value = picked;
//     dateTimeController.dateDisplayed.value =
//         DateFormat('dd-MM-yyyy').format(dateTimeController.displayDate.value);
//     dateTimeController.yearsDate.value = DateFormat('dd-MM-yyyy')
//         .parse(dateTimeController.dateDisplayed.value)
//         .year;
//     dateTimeController.monthsDate.value = DateFormat('dd-MM-yyyy')
//         .parse(dateTimeController.dateDisplayed.value)
//         .month;
//     dateTimeController.dayDate.value = DateFormat('dd-MM-yyyy')
//         .parse(dateTimeController.dateDisplayed.value)
//         .day;
//   }
// }
//
// Future<void> selectTime(BuildContext context, TimeOfDay currTime) async {
//   final TimeOfDay? timepicker = await showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//     builder: (BuildContext context, Widget? child) {
//       return MediaQuery(
//         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//         child: Theme(
//             data: Theme.of(context).copyWith(
//               colorScheme: ColorScheme.fromSwatch(
//                 primarySwatch: const MaterialColor(0XFF0d0d0d, {
//                   50: Color(0xFF979797),
//                   100: Color(0xFF868686),
//                   200: Color(0xFF757575),
//                   300: Color(0xFF636363),
//                   400: Color(0xFF525252),
//                   500: Color(0xFF414141),
//                   600: Color(0xFF2F2F2F),
//                   700: Color(0xFF1E1E1E),
//                   800: Color(0XFF0d0d0d),
//                 }),
//                 brightness: Brightness.dark,
//                 accentColor: const Color(0XFF800000),
//                 cardColor: const Color(0XFF0d0d0d),
//               ),
//               timePickerTheme: const TimePickerThemeData(
//                 dialHandColor: Color(0XFFFFFFFF),
//                 entryModeIconColor: Color(0XFF800000),
//                 hourMinuteColor: Color(0XFF800000),
//                 helpTextStyle: TextStyle(
//                   fontFamily: 'GlacialIndifference',
//                   fontSize: 19,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 1.2,
//                   color: Color(0XFFFFFFFF),
//                 ),
//                 dayPeriodTextStyle: TextStyle(
//                   fontFamily: 'GlacialIndifference',
//                   fontSize: 19,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 1.2,
//                   color: Color(0XFFFFFFFF),
//                 ),
//                 dialTextStyle: TextStyle(
//                   fontFamily: 'GlacialIndifference',
//                   fontSize: 19,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 1.2,
//                   color: Color(0XFFFFFFFF),
//                 ),
//                 hourMinuteTextStyle: TextStyle(
//                   fontFamily: 'GlacialIndifference',
//                   fontSize: 19,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 1.2,
//                   color: Color(0XFFFFFFFF),
//                 ),
//                 cancelButtonStyle: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Color(0XFF202020)),
//                   foregroundColor: MaterialStatePropertyAll(Colors.white),
//                   textStyle: MaterialStatePropertyAll(
//                     TextStyle(
//                       fontFamily: 'GlacialIndifference',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 confirmButtonStyle: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Color(0XFF202020)),
//                   foregroundColor: MaterialStatePropertyAll(Colors.white),
//                   textStyle: MaterialStatePropertyAll(
//                     TextStyle(
//                       fontFamily: 'GlacialIndifference',
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             child: child!),
//       );
//     },
//   );
//   if (timepicker != null) {
//     dateTimeController.displayTime.value = timepicker;
//     dateTimeController.hoursTime.value =
//         dateTimeController.displayTime.value.hour;
//     dateTimeController.minuteTime.value =
//         dateTimeController.displayTime.value.minute;
//   }
// }

// Widget floatingBottomNavBar(BuildContext context) {
//   return Container(
//     height: 70,
//     width: 250,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(50),
//       color: const Color(0XFF313131),
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () {},
//           child: const CircleAvatar(
//             radius: 36,
//             backgroundColor: Color(0XFFB31B1B),
//             child: Center(
//               child: Icon(
//                 Icons.edit,
//                 size: 18,
//                 color: Color(0XFFFFFFFF),
//               ),
//             ),
//           ),
//         ),
//         const Spacer(),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 CupertinoPageRoute(
//                   builder: (context) => const CreateMeetings(),
//                 ));
//           },
//           child: const CircleAvatar(
//             radius: 36,
//             backgroundColor: Color(0XFFB31B1B),
//             child: Center(
//               child: Icon(
//                 Icons.add,
//                 size: 26,
//                 color: Color(0XFFFFFFFF),
//               ),
//             ),
//           ),
//         ),
//         const Spacer(),
//         GestureDetector(
//           onTap: () {},
//           child: const CircleAvatar(
//             radius: 36,
//             backgroundColor: Color(0XFFB31B1B),
//             child: Center(
//               child: Icon(
//                 Icons.settings,
//                 size: 22,
//                 color: Color(0XFFFFFFFF),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget addTask({
  required final double width,
  required final double dX,
  required final double dY,
}) {
  return Transform.translate(
    offset: Offset(dX, dY),
    child: AnimatedContainer(
        height: 100,
        width: 100 + width,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: const Color(0XFFb60000),
          borderRadius: BorderRadius.circular(50),
        ),
        child: width > 0.0
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    "Task Added",
                    style: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: Color(0XFFFFFFFF),
                    ),
                  )),
                ],
              )
            : const Icon(
                Icons.navigate_next_sharp,
                color: Color(0XFFFFFFFF),
                size: 38,
              )),
  );
}

Widget desktopDashboardView(BuildContext context) {
  return SafeArea(
      child: Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 280,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 18),
            decoration: const BoxDecoration(
              color: Color(0XFFF7F9FD),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                verticalSpaceMedium,
                Row(
                  children: [
                    Image.network(
                      "https://tratum.github.io/cloud-asset-storage/images/acadameet/Acadameet-Logo-bgremove.webp",
                      width: 60,
                      height: 60,
                      cacheHeight: 40,
                      cacheWidth: 40,
                      fit: BoxFit.cover,
                    ),
                    horizontalSpaceSmall,
                    const Text(
                      "Acadameet",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'GlacialIndifference',
                        color: Color(0XFF000000),
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                verticalSpaceLarge,
                const Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: 32,
                      color: Color(0XFF799C9C),
                    ),
                    horizontalSpaceSmall,
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'GlacialIndifference',
                        color: Color(0XFF111111),
                      ),
                    ),
                  ],
                ),
                verticalSpaceSemiMedium,
                const Row(
                  children: [
                    Icon(
                      Icons.mail,
                      size: 28,
                      color: Color(0XFF799C9C),
                    ),
                    horizontalSpaceSmall,
                    Text(
                      "Messages",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'GlacialIndifference',
                        color: Color(0XFF111111),
                      ),
                    ),
                  ],
                ),
                verticalSpaceSemiMedium,
                const Row(
                  children: [
                    Icon(
                      Icons.event_note_sharp,
                      size: 28,
                      color: Color(0XFF799C9C),
                    ),
                    horizontalSpaceSmall,
                    Text(
                      "Appointments",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'GlacialIndifference',
                        color: Color(0XFF111111),
                      ),
                    ),
                  ],
                ),
                verticalSpaceSemiMedium,
                const Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 28,
                      color: Color(0XFF799C9C),
                    ),
                    horizontalSpaceSmall,
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'GlacialIndifference',
                        color: Color(0XFF111111),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFFEDF0F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 400,
                    height: 40,
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF6F6E7C),
                        ),
                        prefixIcon: Icon(Icons.search_rounded,
                            size: 24, color: Color(0XFF6F6E7C)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 4, left: 8),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 40),
                  child: Icon(
                    Icons.notifications,
                    size: 28,
                    color: Color(0XFF6C9191),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, right: 40, left: 20),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0XFF292929),
                    backgroundImage: NetworkImage(
                      scale: 1,
                      "https://tratum.github.io/cloud-asset-storage/images/sample-profile-icon.webp",
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceSemiMedium,
            Row(
              children: [
                horizontalSpaceMedium,
                const Text(
                  "Appointments",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'GlacialIndifference',
                    color: Color(0XFF000000),
                    fontSize: 32,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Add",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'GlacialIndifference',
                          color: Color(0XFF000000),
                          fontSize: 24,
                        ),
                      ),
                      horizontalSpaceSmall,
                      Icon(
                        Icons.add_box_outlined,
                        size: 28,
                        color: Color(0XFF0F1515),
                      ),
                    ],
                  ),
                ),
                horizontalSpaceMedium,
              ],
            ),
            verticalSpaceSemiSmall,
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width - 300,
                color: const Color(0XFFE5E4E2),
              ),
            ),
            verticalSpaceSemiMedium,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0XFF000000),
                            width: 1.4,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.refresh_sharp,
                            color: Color(0XFF111111),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ],
  ));
}

Widget desktopLoginView(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0XFF101010),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Image.network(
                  "https://tratum.github.io/cloud-asset-storage/images/acadameet/Acadameet-Logo-bgremove.webp",
                  cacheWidth: 80,
                  cacheHeight: 80,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                horizontalSpaceMedium,
                const Text(
                  "Acadameet",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'GlacialIndifference',
                    color: Color(0XFFFFFFFF),
                    fontSize: 52,
                  ),
                ),
                const Spacer(),
              ],
            ),
            verticalSpaceMedium,
            const Text(
              "Connecting Students and Faculty with Ease, One Click at a Time",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'GlacialIndifference',
                color: Color(0XFFFFFFFF),
                fontSize: 32,
              ),
            ),
            verticalSpaceLarge,
            Center(
              child: Image.network(
                "https://tratum.github.io/cloud-asset-storage/images/acadameet/f-nobg.webp",
                width: MediaQuery.of(context).size.width / 0.75,
                height: MediaQuery.of(context).size.height / 2.2,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            verticalSpaceSemiMassive,
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final result = await MicrosoftAuth.oauth.login();
                    result.fold(
                      (l) => debugPrint('--------------------Error: $l'),
                      (r) {
                        // String? accessToken = r.accessToken;
                        // String? idToken = r.idToken;
                        // String? refreshToken = r.refreshToken;
                        // String? tokenType = r.tokenType;
                        // int? expiresIn = r.expiresIn;
                        saveAccessToken(r.accessToken);
                        authUserDataHandler();
                      },
                    );
                    // microsoftSignIn();
                    // String token = await getAuthToken();
                    // authUserDataHandler(token);
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 12)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0XFFFFFFFF)),
                  ),
                  child: SizedBox(
                    width: 205,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Row(
                        children: [
                          Image.network(
                            "https://tratum.github.io/cloud-asset-storage/images/microsoft-logo.webp",
                            height: 30,
                            width: 30,
                          ),
                          Spacer(),
                          const Text("Sign in with Microsoft",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0XFF5E5E5E))),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            verticalSpaceLarge,
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 12)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0XFFFFFFFF)),
                  ),
                  child: SizedBox(
                    width: 205,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Row(
                        children: [
                          Image.network(
                            "https://tratum.github.io/cloud-asset-storage/images/google.webp",
                            height: 25,
                            width: 25,
                          ),
                          Spacer(),
                          const Text("Sign in with Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0XFF5E5E5E))),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
