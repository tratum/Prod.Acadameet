import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../commons/ui_helpers.dart';
import '../../config/firebase/firestore.dart';
import '../dashboard/dashboard.dart';
import 'controller/datetime_controller.dart';

class CreateMeetings extends StatefulWidget {
  const CreateMeetings({super.key});

  @override
  State<CreateMeetings> createState() => _CreateMeetingsState();
}

class _CreateMeetingsState extends State<CreateMeetings> {
  DateTime currDate = DateTime.now();
  TimeOfDay currTime = TimeOfDay.now();
  DateTimeController dateTimeController = Get.put(DateTimeController());
  TextEditingController nameConn = TextEditingController();
  TextEditingController descConn = TextEditingController();
  TextEditingController mailConn = TextEditingController();
  double dWidth = 0.0;
  double translateX = 0.0;
  double translateY = 0.0;
  String cDropdownValue = 'placeholder';
  String mDropdownValue = 'placeholder';
  final List<String> _options = ['Low', 'High'];
  int _selectedIndex = 0;
  bool isDataSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0d0d0d),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 36),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        radius: 36,
                        backgroundColor: Color(0XFF292929),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: Color(0XFFC0C0C0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // const Padding(
                  //   padding: EdgeInsets.only(right: 18, top: 36),
                  //   child: CircleAvatar(
                  //     radius: 36,
                  //     backgroundColor: Color(0XFF292929),
                  //     child: Center(
                  //       child: Icon(
                  //         Icons.notifications_outlined,
                  //         size: 26,
                  //         color: Color(0XFFC0C0C0),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Create",
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 46,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "New",
                      style: TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 46,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: Color(0XFFFFFFFF)),
                    ),
                    TextSpan(
                      text: " Meetings",
                      style: TextStyle(
                        fontFamily: 'GlacialIndifference',
                        fontSize: 46,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                        color: Color(0XFF8E8E95),
                      ),
                    ),
                  ]),
                ),
              ),
              verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Name & Description",
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFormField(
                  controller: nameConn,
                  cursorColor: const Color(0XFFFFFFFF),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0XFF202020),
                      child: Center(
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 24,
                          color: Color(0XFFFFFFFF),
                        ),
                      ),
                    ),
                    hintText: "Name",
                    hintStyle: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: Color(0XFF8E8E95),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFormField(
                  controller: descConn,
                  cursorColor: const Color(0XFFFFFFFF),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0XFF202020),
                      child: Center(
                        child: Icon(
                          Icons.description_outlined,
                          size: 24,
                          color: Color(0XFFFFFFFF),
                        ),
                      ),
                    ),
                    hintText: "Description",
                    hintStyle: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: Color(0XFF8E8E95),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceLarge,
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Institution",
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceSemiSmall,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: DropdownButton<String>(
                  value: cDropdownValue,
                  iconEnabledColor: const Color(0XFFb60000),
                  iconDisabledColor: const Color(0XFF202020),
                  dropdownColor: const Color(0XFF202020),
                  focusColor: const Color(0XFFb60000),
                  borderRadius: BorderRadius.circular(15),
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'placeholder',
                      enabled: false,
                      child: Center(
                        child: Text(
                          "Select Institution",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF8E8E95),
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'MAHE, Jaipur',
                      child: Center(
                        child: Text(
                          "MAHE, Jaipur",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'MAHE, Manipal',
                      child: Center(
                        child: Text(
                          "MAHE, Manipal",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'MAHE, Mangalore',
                      child: Center(
                        child: Text(
                          "MAHE, Mangalore",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'MAHE, Bangalore',
                      child: Center(
                        child: Text(
                          "MAHE, Bangalore",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      cDropdownValue = value!;
                    });
                  },
                ),
              ),
              verticalSpaceLarge,
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Work Email",
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: TextFormField(
                  controller: mailConn,
                  cursorColor: const Color(0XFFFFFFFF),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0XFF202020),
                      child: Center(
                        child: Icon(
                          Icons.mail_outline_sharp,
                          size: 24,
                          color: Color(0XFFFFFFFF),
                        ),
                      ),
                    ),
                    hintText: "Work E-mail",
                    hintStyle: TextStyle(
                      fontFamily: 'GlacialIndifference',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: Color(0XFF8E8E95),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceLarge,
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Meeting Type",
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceSemiSmall,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: DropdownButton<String>(
                  value: mDropdownValue,
                  iconEnabledColor: const Color(0XFFb60000),
                  iconDisabledColor: const Color(0XFF202020),
                  dropdownColor: const Color(0XFF202020),
                  focusColor: const Color(0XFFb60000),
                  borderRadius: BorderRadius.circular(15),
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'placeholder',
                      enabled: false,
                      child: Center(
                        child: Text(
                          "Type Of Meeting",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF8E8E95),
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'In-Person Meeting',
                      child: Center(
                        child: Text(
                          "In-Person",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Virtual Meeting',
                      child: Center(
                        child: Text(
                          "Virtual",
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      mDropdownValue = value!;
                    });
                  },
                ),
              ),
              verticalSpaceLarge,
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Priority",
                  style: TextStyle(
                    fontFamily: 'GlacialIndifference',
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 150,
                  decoration: BoxDecoration(
                    color: const Color(0XFF202020),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _options.map((option) {
                      int index = _options.indexOf(option);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? const Color(0XFFB60000)
                                : const Color(0XFF202020),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontFamily: 'GlacialIndifference',
                              fontSize: 18,
                              fontWeight: _selectedIndex == index
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              letterSpacing: 1.2,
                              color: _selectedIndex == index
                                  ? const Color(0XFFFFFFFF)
                                  : const Color(0XFFFFFFFF),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              verticalSpaceLarge,
              const Padding(
                padding: EdgeInsets.only(left: 18, right: 18),
                child: Row(
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                        fontFamily: 'GlacialIndifference',
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Time",
                      style: TextStyle(
                        fontFamily: 'GlacialIndifference',
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFFFFFFF),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 32,
                            backgroundColor: Color(0XFF202020),
                            child: Center(
                              child: Icon(
                                Icons.calendar_month_sharp,
                                size: 24,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          Obx(
                            () => Text(
                              DateFormat('d MMMM')
                                  .format(dateTimeController.displayDate.value),
                              style: const TextStyle(
                                fontFamily: 'GlacialIndifference',
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 32,
                            backgroundColor: Color(0XFF202020),
                            child: Center(
                              child: Icon(
                                Icons.access_time_filled_sharp,
                                size: 24,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          Obx(
                            () => Text(
                              dateTimeController.displayTime.value
                                  .format(context),
                              style: const TextStyle(
                                fontFamily: 'GlacialIndifference',
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0XFF202020),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onHorizontalDragUpdate: (event) async {
                      if (event.primaryDelta! > 10 && !isDataSent) {
                        // Check if data has not been sent
                        _increaseDxValue(
                          context: context,
                        );
                        Database.sendMeetingData(
                          name: nameConn.text.toString().trim(),
                          desc: descConn.text.toString().trim(),
                          institute: cDropdownValue,
                          workMail: mailConn.text.toString().trim(),
                          meetingType: mDropdownValue,
                          priority: _options[_selectedIndex],
                          scheduleDate: DateFormat('d MMMM')
                              .format(dateTimeController.displayDate.value),
                          scheduleTime: dateTimeController.displayTime.value
                              .format(context),
                        );
                        isDataSent = true;

                        Future.delayed(const Duration(milliseconds: 800), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()),
                          ).then((_) {
                            setState(() {
                              isDataSent = false;
                            });
                          });
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _addTask(),
                        dWidth == 0.0
                            ? const Expanded(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Schedule",
                                      style: TextStyle(
                                        fontFamily: 'GlacialIndifference',
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                        color: Color(0XFFFFFFFF),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0XFFFFFFFF),
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0XFFFFFFFF),
                                      size: 18,
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  Widget _addTask() => Transform.translate(
        offset: Offset(translateX, translateY),
        child: AnimatedContainer(
          height: 100,
          width: 100 + dWidth,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          decoration: BoxDecoration(
            color: const Color(0XFFb60000),
            borderRadius: BorderRadius.circular(50),
          ),
          child: dWidth > 0.0
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Text(
                      "Scheduled",
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
                ),
        ),
      );

  _increaseDxValue({
    required BuildContext context,
  }) async {
    int canLoop = -1;
    for (var i = 0; canLoop == -1; i++) {
      await Future.delayed(const Duration(milliseconds: 1), () {
        setState(() {
          if (translateX + 1 <
              MediaQuery.of(context).size.width - (140 + dWidth)) {
            translateX += 1;
            dWidth = MediaQuery.of(context).size.width - (140 + dWidth);
          } else {
            setState(() {
              canLoop = 1;
            });
          }
        });
      });
    }
  }
}
