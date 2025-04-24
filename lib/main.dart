import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoxton_wealth_project/UI/splash_screen/splash_screen.dart';
import 'package:hoxton_wealth_project/bloc/carousel_section_bloc.dart';
import 'package:hoxton_wealth_project/repositories/carousel_repository.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarouselSectionBloc(CarouselRepository()),
      child: MaterialApp(
        title: 'Hoxton Wealth Project',
        debugShowCheckedModeBanner: false,
       
        home: SplashScreen(),
      ),
    );
  }
}

