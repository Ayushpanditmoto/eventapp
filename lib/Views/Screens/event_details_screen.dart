import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventapp/Data/Models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:shimmer/shimmer.dart';

class EventDetailsScreen extends StatefulWidget {
  final Datum eventData;
  const EventDetailsScreen({
    super.key,
    required this.eventData,
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              //image in top
              Column(
                children: [
                  //image
                  CachedNetworkImage(
                    imageUrl: widget.eventData.bannerImage,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),

                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.3,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image:
                  //           CachedNetworkImageProvider(eventData.bannerImage),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  //title
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      widget.eventData.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  EventCompo(
                    image: 'assets/eventd1.png',
                    title: 'The Internet Folks',
                    subtitle: widget.eventData.organiserName,
                  ),
                  const SizedBox(height: 20),
                  EventCompo(
                    image: 'assets/Date.png',
                    title: DateFormat(
                      'dd MMMM, yyyy',
                    ).format(widget.eventData.dateTime),
                    // Tuesday, 4:00PM - 9:00PM
                    subtitle: DateFormat('EEEE, h:mma -9:00a')
                        .format(widget.eventData.dateTime),
                  ),
                  const SizedBox(height: 20),
                  EventCompo(
                    image: 'assets/Location.png',
                    title: widget.eventData.venueName,
                    subtitle:
                        '${widget.eventData.venueCity}, ${widget.eventData.venueCountry}',
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About Event",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                            text: const TextSpan(
                          text:
                              'Enjoy Your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.4,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: 'Read More...',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Button Book Now with arrow on right
                ],
              ),
              //Text
              Positioned(
                  bottom: 20, child: Image.asset('assets/Rectangle.png')),
              const Positioned(
                bottom: 20,
                child: BookNowButton(),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Text(
                          'Event Details',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //blur effect on right bookmark icon rounnded
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                right: 20,
                child: const BlurryContainer(
                  elevation: 0,
                  width: 40,
                  height: 40,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.bookmark_rounded,
                    size: 20,
                    color: Colors.white,
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

class BookNowButton extends StatelessWidget {
  const BookNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 86, 106, 255),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left blank
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              //middle
              const Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //arrow
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //#3D56F0
                  color: const Color.fromARGB(255, 61, 86, 240),

                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCompo extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const EventCompo({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Image
          Image.asset(
            image,
            width: 60,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
