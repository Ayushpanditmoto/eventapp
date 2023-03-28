import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventapp/Data/Models/event_model.dart';
import 'package:eventapp/Views/Screens/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SingleSearchCard extends StatelessWidget {
  final Datum eventData;
  const SingleSearchCard({super.key, required this.eventData});

  String getFormatedDate(int day) {
    return day == 1
        ? 'd\'ST\' MMM-EEE -hh:mm a'
        : day == 2
            ? 'd\'ND\' MMM-EEE -hh:mm a'
            : day == 3
                ? 'd\'RD\' MMM-EEE -hh:mm a'
                : day == 21
                    ? 'd\'ST\' MMM-EEE -hh:mm a'
                    : day == 22
                        ? 'd\'ND\' MMM-EEE -hh:mm a'
                        : day == 23
                            ? 'd\'RD\' MMM-EEE -hh:mm a'
                            : day == 31
                                ? 'd\'ST\' MMM-EEE -hh:mm a'
                                : 'd\'TH\' MMM-EEE -hh:mm a';
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(eventData.dateTime.day.toString());
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(
              eventData: eventData,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Image
                if (eventData.organiserIcon.endsWith('.svg'))
                  SvgPicture.network(
                    eventData.organiserIcon,
                    width: MediaQuery.of(context).size.width * 0.16,
                    fit: BoxFit.contain,
                    placeholderBuilder: (context) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: MediaQuery.of(context).size.width * 0.16,
                      ),
                    ),
                  )
                else
                  CachedNetworkImage(
                    imageUrl: eventData.organiserIcon,
                    width: MediaQuery.of(context).size.width * 0.16,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: MediaQuery.of(context).size.width * 0.16,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.person, color: Colors.grey),
                  ),
                // Text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Date and time
                        // 1ST MAY-SAT -2:00 PM
                        //2023-12-08T09:00:00+05:30
                        Text(
                            DateFormat(getFormatedDate(eventData.dateTime.day))
                                .format(eventData.dateTime)
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF5669FF),
                              fontWeight: FontWeight.w400,
                            )),
                        Text(
                          eventData.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
