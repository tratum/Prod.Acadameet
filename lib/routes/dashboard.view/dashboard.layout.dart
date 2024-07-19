import 'package:acadameet/app/app.colors.dart';
import 'package:acadameet/app/app.hover.extensions.dart';
import 'package:acadameet/routes/dashboard.view/tabs/tabs.past.events.dart';
import 'package:acadameet/routes/dashboard.view/tabs/tabs.upcoming.dart';
import 'package:acadameet/views/views.dialog/dialogs.createMeeting.dart';
import 'package:flutter/material.dart';

import '../../app/app.common.functions.dart';
import '../../app/app.common.widgets.dart';
import '../../app/app.constants.dart';

Widget desktopDashboardLayout(BuildContext context, String accessToken) {
  final List<Tab> tabs = [
    const Tab(
      text: "Upcoming",
    ),
    const Tab(
      text: "Past Events",
    )
  ];
  return DefaultTabController(
    length: 2,
    child: SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Outfit',
                        color: Color(0XFF000000),
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                verticalSpaceLarge,
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: const Row(
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
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Outfit',
                          color: Color(0XFF111111),
                        ),
                      ),
                    ],
                  ).scaleOnHover(scale: 10),
                ),
                verticalSpaceSemiMedium,
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 28,
                        color: buttonSecondary,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        "Messages",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Outfit',
                          color: Color(0XFF111111),
                        ),
                      ),
                    ],
                  ).scaleOnHover(scale: 10),
                ),
                verticalSpaceSemiMedium,
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.event_note_sharp,
                        size: 28,
                        color: buttonSecondary,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        "Appointments",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Outfit',
                          color: Color(0XFF111111),
                        ),
                      ),
                    ],
                  ).scaleOnHover(scale: 10),
                ),
                verticalSpaceSemiMedium,
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.perm_contact_calendar_sharp,
                        size: 28,
                        color: buttonSecondary,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        "Contacts",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Outfit',
                          color: Color(0XFF111111),
                        ),
                      ),
                    ],
                  ).scaleOnHover(scale: 10),
                ),
                verticalSpaceSemiMedium,
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 28,
                        color: buttonSecondary,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Outfit',
                          color: Color(0XFF111111),
                        ),
                      ),
                    ],
                  ).scaleOnHover(scale: 10),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSemiMedium,
                  Row(
                    children: [
                      Container(
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
                              fontFamily: 'Outfit',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF6F6E7C),
                            ),
                            prefixIcon: Icon(Icons.search_rounded,
                                size: 24, color: buttonSecondary),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 4, left: 8),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.notifications,
                        size: 28,
                        color: buttonSecondary,
                      ),
                      horizontalSpaceSemiMedium,
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: const Color(0XFF292929),
                        backgroundImage: getCurrentUser()?.photoURL != null
                            ? NetworkImage(getCurrentUser()!.photoURL!)
                            : const NetworkImage(
                                "https://tratum.github.io/cloud-asset-storage/images/sample-profile-icon.webp"),
                      ),
                      horizontalSpaceSmall,
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 28,
                        color: buttonSecondary,
                      ),
                      horizontalSpaceSemiMedium,
                    ],
                  ),
                  verticalSpaceSemiMedium,
                  Row(
                    children: [
                      horizontalSpaceSemiSmall,
                      const Text(
                        "Appointments",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Outfit',
                          color: Color(0XFF000000),
                          fontSize: 28,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CreateMeetingDialog(
                              accessToken: accessToken,
                            ),
                            useSafeArea: true,
                            barrierDismissible: false,
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Add",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Outfit',
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
                  lineSeparator(
                    2,
                    MediaQuery.of(context).size.width - 300,
                    const Color(0XFFE5E4E2),
                  ),
                  verticalSpaceSemiMedium,
                  Row(
                    children: [
                      horizontalSpaceSemiSmall,
                      GestureDetector(
                        onTap: () {},
                        child: Container(
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
                      ),
                      SizedBox(
                        width: 300,
                        child: TabBar(
                          tabs: tabs,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Outfit',
                            fontSize: 22,
                          ),
                          labelColor: const Color(0XFF000000),
                          indicator: CustomTabIndicator(),
                          indicatorWeight: 0,
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          // indicatorColor: Color(0XFF6F6E7C),
                          // indicatorSize: TabBarIndicatorSize.label,
                          unselectedLabelColor: const Color(0XFF111111),
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Outfit',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSemiMedium,
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          horizontalSpaceSemiSmall,
                          SizedBox(
                            width: getScreenWidth(context) - 320,
                            height: getScreenHeight(context) - 100,
                            child: const TabBarView(children: [
                              UpcomingTab(),
                              PastEventsTab(),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget mobileDashboardLayout(BuildContext context) {
  return const Placeholder();
}

Widget tabletDashboardLayout(BuildContext context) {
  return const Placeholder();
}
