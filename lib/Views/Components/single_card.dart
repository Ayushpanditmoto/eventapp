import 'package:eventapp/Data/Models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SingleCard extends StatelessWidget {
  final Datum eventData;
  const SingleCard({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.16,
                  height: MediaQuery.of(context).size.width * 0.16,
                  child: SvgPicture.network(
                    eventData.organiserIcon,
                    width: MediaQuery.of(context).size.width * 0.16,
                    height: MediaQuery.of(context).size.width * 0.16,
                    fit: BoxFit.contain,
                    placeholderBuilder: (context) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: MediaQuery.of(context).size.width * 0.16,
                      ),
                    ),
                  ),
                )
              else
                CachedNetworkImage(
                  imageUrl: eventData.organiserIcon,
                  width: MediaQuery.of(context).size.width * 0.16,
                  height: MediaQuery.of(context).size.width * 0.16,
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

              // Image.network(
              //   eventData.organiserIcon,
              //   width: MediaQuery.of(context).size.width * 0.16,
              //   fit: BoxFit.contain,
              //   errorBuilder: (context, url, error) =>
              //       const Icon(Icons.person, color: Colors.grey),
              // ),

              // Text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Date Wed, Apr 28 dot 5:00 PM
                      Text(
                          "${DateFormat('EEE, MMM d').format(eventData.dateTime)} • ${DateFormat('h:mm a').format(eventData.dateTime)}",
                          style: const TextStyle(
                            fontSize: 16,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 23,
                              color: Colors.grey,
                            ),
                            Flexible(
                              child: Text(
                                eventData.venueName,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            const SizedBox(width: 5),
                            if (eventData.venueCity.isNotEmpty)
                              Flexible(
                                child: Text(
                                  "• ${eventData.venueCity},${eventData.venueCountry}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                          ],
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
    );
  }
}
