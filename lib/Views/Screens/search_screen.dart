import 'package:eventapp/Logic/cubits/event.cubit.dart';
import 'package:eventapp/Logic/cubits/event.state.dart';
import 'package:eventapp/Views/Components/search_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> searchedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.values[5],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  'assets/searchnew.png',
                  width: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  '|',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 121, 116, 231)),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      // BlocProvider.of<EventCubit>(context).getEvents();
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        hintText: 'Type Event Name',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          //List of events
          Expanded(
            child: BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                if (state is EventStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is EventStateSuccess) {
                  searchedEvents = state.events
                      .where((element) => element.title
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase()))
                      .toList();

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    itemCount: searchedEvents.length,
                    itemBuilder: (context, index) {
                      return SingleSearchCard(
                        eventData: searchedEvents[index],
                      );
                    },
                  );
                }
                return const Center(
                  child: Text('No Events Found'),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
