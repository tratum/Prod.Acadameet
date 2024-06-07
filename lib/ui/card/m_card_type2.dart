import 'package:acadameet/commons/ui_helpers.dart';
import 'package:flutter/material.dart';

class MeetingCard2 extends StatefulWidget {
  const MeetingCard2({
    super.key,
    required this.institution,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.name,
    required this.docID,
  });

  final String institution, scheduledDate, scheduledTime, name, docID;

  @override
  State<MeetingCard2> createState() => _MeetingCard2State();
}

class _MeetingCard2State extends State<MeetingCard2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 190,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: const Color(0XFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0XFFe4e4e4),
                    backgroundImage: NetworkImage(
                      scale: 1,
                      "https://tratum.github.io/cloud-asset-storage/images/sample -profile-icon-bg-removed.webp",
                    ),
                  ),
                  horizontalSpaceSmall,
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Color(0XFF000000),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0XFFe4e4e4),
                    child: Center(
                        child: Image.network(
                      "https://tratum.github.io/cloud-asset-storage/images/outgoing-call-black.webp",
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    )),
                  ),
                ],
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.institution,
                          style: const TextStyle(
                            fontFamily: 'GlacialIndifference',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: Color(0XFF000000),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.scheduledDate,
                        style: const TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Color(0XFF000000),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      verticalSpaceTiny,
                      Text(
                        widget.scheduledTime,
                        style: const TextStyle(
                          fontFamily: 'GlacialIndifference',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Color(0XFF000000),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
