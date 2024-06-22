import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../commons/scale_on_hover.dart';
import '../../../commons/ui_helpers.dart';
import 'dashboard_view_model.dart';

class DashboardViewMobile extends ViewModelWidget<DashboardViewModel> {
  const DashboardViewMobile({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        surfaceTintColor: const Color(0XFFFFFFFF),
        backgroundColor: const Color(0XFFFFFFFF),
        title: const SelectableText(
          'tratum.dev',
          style: TextStyle(
            fontFamily: 'Yatra',
            fontSize: 26,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: Color(0XFF353839),
          ),
        ),
        elevation: 20,
        // shadowColor: const Color(0XFFfafafa),
        iconTheme: const IconThemeData(
          color: Color(0XFF353839),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0XFFFFFFFF),
        surfaceTintColor: const Color(0XFFFFFFFF),
        width: 180,
        child: Padding(
          padding: const EdgeInsets.only(left: 28, top: 28),
          child: ListView(
            children: [
              verticalSpaceLarge,
              ListTile(
                title: const ScaleOnHover(
                  scale: 12,
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              verticalSpaceSemiMedium,
              ListTile(
                title: const ScaleOnHover(
                  scale: 12,
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              verticalSpaceSemiMedium,
              ListTile(
                title: const ScaleOnHover(
                  scale: 12,
                  child: Text(
                    'Projects',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              verticalSpaceSemiMedium,
              ListTile(
                title: const ScaleOnHover(
                  scale: 12,
                  child: Text(
                    'Resume',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              verticalSpaceSemiMedium,
              ListTile(
                title: const ScaleOnHover(
                  scale: 12,
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: const SafeArea(
        child: Placeholder(),
        // child: ResponsiveWebLayout.buildMobileLayout(
        //   context: context,
        //   largeMobileLayout: ,
        //   mediumMobileLayout: ,
        //   smallMobileLayout: ,
        // ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 20,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      //   backgroundColor: const Color(0XFF121212),
      //   onPressed: () {
      //     if (viewModel.isAtBottom) {
      //       ContentScrolling.autoScroll(
      //         scrollPosition:
      //             viewModel.scrollController.position.minScrollExtent,
      //         conn: viewModel.scrollController,
      //       );
      //     } else {
      //       ContentScrolling.autoScroll(
      //         scrollPosition:
      //             viewModel.scrollController.position.maxScrollExtent,
      //         conn: viewModel.scrollController,
      //       );
      //     }
      //   },
      //   child: Center(
      //     child: ScaleOnHover(
      //       scale: 22,
      //       child: FaIcon(
      //         viewModel.isAtBottom
      //             ? FontAwesomeIcons.chevronUp
      //             : FontAwesomeIcons.chevronDown,
      //         size: 18,
      //         color: const Color(0XFFfafafa),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
