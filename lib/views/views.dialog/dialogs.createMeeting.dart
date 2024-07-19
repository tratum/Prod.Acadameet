import 'dart:developer';

import 'package:acadameet/app/app.common.functions.dart';
import 'package:flutter/material.dart';

import '../../app/app.constants.dart';

class CreateMeetingDialog extends StatefulWidget {
  final String accessToken;
  const CreateMeetingDialog({super.key, required this.accessToken});

  @override
  State<CreateMeetingDialog> createState() => _CreateMeetingDialogState();
}

class _CreateMeetingDialogState extends State<CreateMeetingDialog> {
  // Fields Required
  // - email title
  // - email body
  // - Google Meeting Title
  // - Meeting Start Time
  // - Meeting End Time

  bool addMeetingSwitch = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailRecipientController =
      TextEditingController();
  final TextEditingController emailTitleController = TextEditingController();
  final TextEditingController emailBodyController = TextEditingController();
  final TextEditingController emailDateController = TextEditingController();
  final TextEditingController emailTimeController = TextEditingController();
  final TextEditingController meetingSummaryController =
      TextEditingController();
  final TextEditingController meetingDateController = TextEditingController();
  final TextEditingController meetingTimeController = TextEditingController();
  final List<int> _duration = [10, 15, 30, 60];
  int _meetingSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    emailDateController.text = formatDate(DateTime.now());
    emailTimeController.text = formatTime(TimeOfDay.now());
    meetingDateController.text = formatDate(DateTime.now());
    meetingTimeController.text = formatTime(TimeOfDay.now());
  }

  Future<void> dateSelector(
      BuildContext context, TextEditingController controller) async {
    final DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0XFFB31B1B),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
              datePickerTheme: const DatePickerThemeData(
                backgroundColor: Colors.white,
                headerBackgroundColor: Color(0XFFB31B1B),
              ),
            ),
            child: child!,
          );
        });
    if (datePicker != null) {
      setState(() {
        controller.text = formatDate(datePicker);
      });
    }
  }

  Future<void> timeSelector(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? timepicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0XFFB31B1B),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
              timePickerTheme: const TimePickerThemeData(
                backgroundColor: Colors.white,
                dialBackgroundColor: Colors.white,
                dayPeriodColor: Color(0XFFB31B1B),
                dayPeriodTextColor: Colors.white,
              )),
          child: child!,
        );
      },
    );
    if (timepicker != null && timepicker != TimeOfDay.now()) {
      setState(() {
        controller.text = formatTime(timepicker);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: getScreenHeight(context) / 1.15,
        width: getScreenWidth(context) / 2.1,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      const Text(
                        "Schedule Appointment",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Outfit',
                          color: Color(0XFF000000),
                          fontSize: 32,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Color(0XFF000000),
                            size: 28,
                          )),
                    ],
                  ),
                  verticalSpaceLarge,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Outfit',
                                  color: Color(0XFF000000),
                                  fontSize: 24,
                                ),
                              ),
                              verticalSpaceSemiMedium,
                              SizedBox(
                                width: 260,
                                child: TextFormField(
                                  controller: emailRecipientController,
                                  cursorColor: const Color(0xFF000000),
                                  cursorWidth: 3,
                                  cursorRadius: const Radius.circular(5),
                                  style:
                                      const TextStyle(color: Color(0xFF000000)),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'Enter Recipient';
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: InputDecoration(
                                    labelText: "Recipient",
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF000000),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF6F6E7C),
                                        width: 2,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF6F6E7C),
                                        width: 2,
                                      ),
                                    ),
                                    suffixStyle: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceSemiMedium,
                              SizedBox(
                                width: 260,
                                child: TextFormField(
                                  controller: emailTitleController,
                                  cursorColor: const Color(0xFF000000),
                                  cursorWidth: 3,
                                  cursorRadius: const Radius.circular(5),
                                  style:
                                      const TextStyle(color: Color(0xFF000000)),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'Enter Title';
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: InputDecoration(
                                    labelText: "Title",
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF000000),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF6F6E7C),
                                        width: 2,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF6F6E7C),
                                        width: 2,
                                      ),
                                    ),
                                    suffixStyle: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceSemiMedium,
                              SizedBox(
                                width: 320,
                                child: TextFormField(
                                  controller: emailBodyController,
                                  cursorColor: const Color(0xFF000000),
                                  cursorWidth: 3,
                                  cursorRadius: const Radius.circular(5),
                                  style:
                                      const TextStyle(color: Color(0xFF000000)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'Enter Body';
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.disabled,
                                  decoration: InputDecoration(
                                    hintText: "Body",
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF000000),
                                        width: 2,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF6F6E7C),
                                        width: 2,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF6F6E7C),
                                        width: 2,
                                      ),
                                    ),
                                    suffixStyle: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpaceSemiMedium,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => dateSelector(
                                        context, emailDateController),
                                    child: SizedBox(
                                      width: 140,
                                      child: AbsorbPointer(
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: emailDateController,
                                          cursorColor: const Color(0xFF000000),
                                          cursorWidth: 3,
                                          cursorRadius:
                                              const Radius.circular(5),
                                          style: const TextStyle(
                                              color: Color(0xFF000000)),
                                          keyboardType: TextInputType.datetime,
                                          validator: (value) {
                                            if (value == null || value == '') {
                                              return 'Enter Date';
                                            }
                                            return null;
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          decoration: InputDecoration(
                                            labelText: "Email Date",
                                            labelStyle: const TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xFF000000),
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0XFF6F6E7C),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0XFF6F6E7C),
                                                width: 2,
                                              ),
                                            ),
                                            suffixStyle: const TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceMedium,
                                  GestureDetector(
                                    onTap: () => timeSelector(
                                        context, emailTimeController),
                                    child: SizedBox(
                                      width: 100,
                                      child: AbsorbPointer(
                                        child: TextFormField(
                                          readOnly: true,
                                          controller: emailTimeController,
                                          cursorColor: const Color(0xFF000000),
                                          cursorWidth: 3,
                                          cursorRadius:
                                              const Radius.circular(5),
                                          style: const TextStyle(
                                              color: Color(0xFF000000)),
                                          keyboardType: TextInputType.datetime,
                                          validator: (value) {
                                            if (value == null ||
                                                value == '' ||
                                                value ==
                                                    formatTime(
                                                        TimeOfDay.now())) {
                                              return 'Enter Time';
                                            }
                                            return null;
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          decoration: InputDecoration(
                                            labelText: "Email Time",
                                            labelStyle: const TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0xFF000000),
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0XFF6F6E7C),
                                                width: 2,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color(0XFF6F6E7C),
                                                width: 2,
                                              ),
                                            ),
                                            suffixStyle: const TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // verticalSpaceSemiMedium,
                              // const Text(
                              //   "Duration In Minutes",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.w400,
                              //     fontFamily: 'Outfit',
                              //     color: Color(0XFF000000),
                              //     fontSize: 18,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // Container(
                              //   width: 290,
                              //   decoration: BoxDecoration(
                              //     color: const Color(0XFF202020),
                              //     borderRadius: BorderRadius.circular(25),
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceEvenly,
                              //     children: _duration.map((option) {
                              //       int index = _duration.indexOf(option);
                              //       return GestureDetector(
                              //         onTap: () {
                              //           setState(() {
                              //             _emailSelectedIndex = index;
                              //           });
                              //         },
                              //         child: AnimatedContainer(
                              //           duration:
                              //               const Duration(milliseconds: 300),
                              //           decoration: BoxDecoration(
                              //             color: _emailSelectedIndex == index
                              //                 ? const Color(0XFFB60000)
                              //                 : const Color(0XFF202020),
                              //             borderRadius:
                              //                 BorderRadius.circular(20),
                              //           ),
                              //           padding: const EdgeInsets.symmetric(
                              //               horizontal: 25, vertical: 12),
                              //           child: Text(
                              //             "$option",
                              //             style: TextStyle(
                              //               fontFamily: 'Outfit',
                              //               fontSize: 18,
                              //               fontWeight:
                              //                   _emailSelectedIndex == index
                              //                       ? FontWeight.w500
                              //                       : FontWeight.w400,
                              //               letterSpacing: 1.2,
                              //               color: _emailSelectedIndex == index
                              //                   ? const Color(0XFFFFFFFF)
                              //                   : const Color(0XFFFFFFFF),
                              //             ),
                              //           ),
                              //         ),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      horizontalSpaceMassive,
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Add Video Confrencing",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Outfit',
                                      color: Color(0XFF000000),
                                      fontSize: 24,
                                    ),
                                  ),
                                  horizontalSpaceSmall,
                                  Switch(
                                    value: addMeetingSwitch,
                                    onChanged: (value) {
                                      setState(() {
                                        addMeetingSwitch = value;
                                      });
                                    },
                                    activeColor: const Color(0XFF000000),
                                    activeTrackColor: const Color(0XFFB60000),
                                  ),
                                ],
                              ),
                              if (addMeetingSwitch) ...[
                                verticalSpaceSemiMedium,
                                SizedBox(
                                  width: 320,
                                  child: TextFormField(
                                    controller: meetingSummaryController,
                                    cursorColor: const Color(0xFF000000),
                                    cursorWidth: 3,
                                    cursorRadius: const Radius.circular(5),
                                    style: const TextStyle(
                                        color: Color(0xFF000000)),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    validator: (value) {
                                      if (value == null || value == '') {
                                        return 'Enter Summary';
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.disabled,
                                    decoration: InputDecoration(
                                      hintText: "Summary",
                                      hintStyle: const TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF000000),
                                          width: 2,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color(0XFF6F6E7C),
                                          width: 2,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color(0XFF6F6E7C),
                                          width: 2,
                                        ),
                                      ),
                                      suffixStyle: const TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                verticalSpaceSemiMedium,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () => dateSelector(
                                          context, meetingDateController),
                                      child: SizedBox(
                                        width: 140,
                                        child: AbsorbPointer(
                                          child: TextFormField(
                                            readOnly: true,
                                            controller: meetingDateController,
                                            cursorColor:
                                                const Color(0xFF000000),
                                            cursorWidth: 3,
                                            cursorRadius:
                                                const Radius.circular(5),
                                            style: const TextStyle(
                                                color: Color(0xFF000000)),
                                            keyboardType:
                                                TextInputType.datetime,
                                            validator: (value) {
                                              if (value == null ||
                                                  value == '') {
                                                return 'Enter Date';
                                              }
                                              return null;
                                            },
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            decoration: InputDecoration(
                                              labelText: "Meeting Date",
                                              labelStyle: const TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF000000),
                                                  width: 2,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFF6F6E7C),
                                                  width: 2,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFF6F6E7C),
                                                  width: 2,
                                                ),
                                              ),
                                              suffixStyle: const TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    horizontalSpaceMedium,
                                    GestureDetector(
                                      onTap: () => timeSelector(
                                          context, meetingTimeController),
                                      child: SizedBox(
                                        width: 110,
                                        child: AbsorbPointer(
                                          child: TextFormField(
                                            readOnly: true,
                                            controller: meetingTimeController,
                                            cursorColor:
                                                const Color(0xFF000000),
                                            cursorWidth: 3,
                                            cursorRadius:
                                                const Radius.circular(5),
                                            style: const TextStyle(
                                                color: Color(0xFF000000)),
                                            keyboardType:
                                                TextInputType.datetime,
                                            validator: (value) {
                                              if (value == null ||
                                                  value == '' ||
                                                  value ==
                                                      formatTime(
                                                          TimeOfDay.now())) {
                                                return 'Enter Time';
                                              }
                                              return null;
                                            },
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            decoration: InputDecoration(
                                              labelText: "Meeting Time",
                                              labelStyle: const TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF000000),
                                                  width: 2,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFF6F6E7C),
                                                  width: 2,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Color(0XFF6F6E7C),
                                                  width: 2,
                                                ),
                                              ),
                                              suffixStyle: const TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpaceSemiMedium,
                                const Text(
                                  "Duration In Minutes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Outfit',
                                    color: Color(0XFF000000),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 290,
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF202020),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: _duration.map((option) {
                                      int index = _duration.indexOf(option);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _meetingSelectedIndex = index;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          decoration: BoxDecoration(
                                            color:
                                                _meetingSelectedIndex == index
                                                    ? const Color(0XFFB60000)
                                                    : const Color(0XFF202020),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 12),
                                          child: Text(
                                            "$option",
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              fontSize: 18,
                                              fontWeight:
                                                  _meetingSelectedIndex == index
                                                      ? FontWeight.w500
                                                      : FontWeight.w400,
                                              letterSpacing: 1.2,
                                              color:
                                                  _meetingSelectedIndex == index
                                                      ? const Color(0XFFFFFFFF)
                                                      : const Color(0XFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSemiLarge,
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0XFF202020),
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Outfit',
                                color: Color(0XFFFFFFFF),
                                fontSize: 18,
                              ),
                            )),
                        horizontalSpaceMedium,
                        ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                // Output Testing
                                // print(emailRecipientController.text
                                //     .toString()
                                //     .toLowerCase());
                                // print(emailTitleController.text.toString());
                                // print(emailBodyController.text
                                //     .toString()
                                //     .replaceAll(RegExp(r'\n\s*\n'), '\n\n'));
                                // print(meetingSummaryController.text.toString());
                                // print(meetingDateController.text.toString());
                                // print(meetingTimeController.text.toString());
                                // print(_duration[_selectedIndex]);
                                await meetingDataHandler(
                                  context: context,
                                  accessToken: widget.accessToken,
                                  recipient: emailRecipientController.text
                                      .toString()
                                      .toLowerCase(),
                                  emailSubject:
                                      emailTitleController.text.toString(),
                                  emailBody:
                                      emailBodyController.text.toString(),
                                  emailDate:
                                      emailDateController.text.toString(),
                                  emailTime:
                                      emailTimeController.text.toString(),
                                  meetingSummary:
                                      meetingSummaryController.text.toString(),
                                  meetingDate:
                                      meetingDateController.text.toString(),
                                  meetingTime:
                                      meetingTimeController.text.toString(),
                                  meetingDuration:
                                      _duration[_meetingSelectedIndex],
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      Navigator.pop(context);
                                    } else {
                                      log("Data fetch failed or returned null");
                                      throw Exception(
                                          "Data fetch failed or returned null");
                                    }
                                  },
                                ).catchError((e) {
                                  log("Exception Thrown with error $e");
                                  throw Exception(
                                      "Exception Thrown with error $e");
                                });
                              } else {}
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFFB60000),
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide.none,
                              ),
                              side: BorderSide.none,
                            ),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Outfit',
                                color: Color(0XFFFFFFFF),
                                fontSize: 18,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
