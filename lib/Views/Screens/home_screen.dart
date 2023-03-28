import 'package:eventapp/Logic/cubits/event.cubit.dart';
import 'package:eventapp/Logic/cubits/event.state.dart';
import 'package:eventapp/Views/Components/single_card.dart';
import 'package:eventapp/Views/Screens/event_details_screen.dart';
import 'package:eventapp/Views/Screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constant/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  Events',
          style: kTitleTextStyle,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Image.asset(
              'assets/search.png',
              width: 25,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<EventCubit>().getEvents(),
        child: BlocBuilder<EventCubit, EventState>(
          builder: (context, state) {
            if (state is EventStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EventStateSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsScreen(
                            eventData: state.events[index],
                          ),
                        ),
                      );
                    },
                    child: SingleCard(
                      eventData: state.events[index],
                    ),
                  );
                },
              );
            } else if (state is EventStateError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),

      // body: ListView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   padding: const EdgeInsets.all(20),
      //   itemCount: eventData.length,
      //   itemBuilder: (context, index) {
      //     return SingleCard(
      //       eventData: eventData[index],
      //     );
      //   },
      // ),
    );
  }
}
