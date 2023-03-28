import 'package:eventapp/Logic/cubits/event.cubit.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/Views/Screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // EventRepository eventRepository = EventRepository();
  // List somepost = await eventRepository.getEvents();

  // log(somepost.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit(),
      child: MaterialApp(
        title: 'Event App',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        home: const HomeScreen(),
        // home: const EventDetailsScreen(),
        // home: const SearchScreen(),
      ),
    );
  }
}
