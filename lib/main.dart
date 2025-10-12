import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/nav_bar/nav_bar_bloc.dart';
import 'package:library_system_application/presentation/screens/home_page.dart';
import 'package:library_system_application/presentation/screens/splash_screen.dart';

void main() {
  runApp(BlocProvider(create: (_) => NavBarBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
