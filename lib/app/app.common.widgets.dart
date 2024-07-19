import 'package:acadameet/app/app.constants.dart';
import 'package:flutter/material.dart';

import 'app.colors.dart';

Widget lineSeparator(double height, double width, Color color) {
  return Container(
    height: height,
    width: width,
    color: color,
  );
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter();
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = buttonSecondary;
    paint.style = PaintingStyle.fill;

    const double indicatorHeight = 6;
    final double indicatorWidth =
        configuration.size!.width * 0.4; // Custom width (40% of the tab width)

    final Offset customOffset = Offset(
      offset.dx + (configuration.size!.width - indicatorWidth) / 2,
      offset.dy + configuration.size!.height - indicatorHeight,
    );

    final Rect rect = customOffset & Size(indicatorWidth, indicatorHeight);
    final RRect roundedRect = RRect.fromRectAndRadius(
        rect, const Radius.circular(indicatorHeight / 2));

    canvas.drawRRect(roundedRect, paint);
  }
}

Widget meetingCard(BuildContext context, String subject, String date,
    String startTime, String email1, String email2) {
  return SizedBox(
      width: 500,
      height: 300,
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color(0XFFEFF3FB),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Outfit',
                  color: Color(0XFF000000),
                  fontSize: 18,
                  letterSpacing: 1,
                ),
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
              verticalSpaceSemiMedium,
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: Color(0XFF000000),
                    size: 18,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    date,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Outfit',
                      color: Color(0XFF000000),
                      fontSize: 16,
                    ),
                  ),
                  horizontalSpaceSmall,
                  lineSeparator(12, 2, const Color(0XFF000000)),
                  horizontalSpaceSmall,
                  const Icon(
                    Icons.alarm_rounded,
                    color: Color(0XFF000000),
                    size: 18,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    startTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Outfit',
                      color: Color(0XFF000000),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              verticalSpaceSemiMedium,
              const Text(
                "Attendees",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Outfit',
                  color: Color(0XFF000000),
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  email1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Outfit',
                    color: Color(0XFF000000),
                    fontSize: 18,
                  ),
                ),
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  email2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Outfit',
                    color: Color(0XFF000000),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
