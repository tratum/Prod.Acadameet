import 'package:flutter/material.dart';

import '../../app/app.constants.dart';

Widget desktopDashboardLayout(BuildContext context) {
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

Widget mobileDashboardLayout(BuildContext context) {
  return const Placeholder();
}

Widget tabletDashboardLayout(BuildContext context) {
  return const Placeholder();
}
