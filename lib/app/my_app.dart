import 'package:flutter/material.dart';
import 'package:rickandmorty/app/ui/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      home: HomePage()
    );
  }
}
