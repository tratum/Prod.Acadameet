import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../commons/common_widgets.dart';
import '../../commons/ui_helpers.dart';
import '../tabs/all_tab.dart';
import '../tabs/in_person_tab.dart';
import '../tabs/virtual_tab.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0d0d0d),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18, top: 36),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Color(0XFF292929),
                        backgroundImage: NetworkImage(
                          scale: 1,
                          "https://tratum.github.io/cloud-asset-storage/images/sample -profile-icon-bg-removed.webp",
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 18, top: 36),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Color(0XFF292929),
                        child: Center(
                          child: Icon(
                            Icons.notifications_outlined,
                            size: 32,
                            color: Color(0XFFC0C0C0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    "Schedule",
                    style: TextStyle(
                        fontFamily: 'GlacialIndifference',
                        fontSize: 46,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                        color: Color(0XFFFFFFFF)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "Your",
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
                          color: Color(0XFF626269),
                        ),
                      ),
                    ]),
                  ),
                ),
                verticalSpaceMedium,
                DefaultTabController(
                  length: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ButtonsTabBar(
                        radius: 20,
                        borderWidth: 1,
                        contentPadding:
                            const EdgeInsets.only(right: 16, left: 16),
                        buttonMargin: const EdgeInsets.all(22),
                        unselectedBorderColor: const Color(0XFF969696),
                        labelStyle: const TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: Color(0XFFFFFFFF),
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          color: Color(0XFF969696),
                        ),
                        backgroundColor: const Color(0XFF292929),
                        unselectedBackgroundColor: const Color(0XFF0d0d0d),
                        height: 86,
                        tabs: const [
                          Tab(
                            text: "All",
                          ),
                          Tab(
                            text: "In-Person",
                          ),
                          Tab(
                            text: "Virtual",
                          ),
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 450,
                          child: const TabBarView(
                            children: [
                              AllTab(),
                              InPersonTab(),
                              VirtualTab(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: floatingBottomNavBar(context),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
