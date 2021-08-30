import 'package:flutter/material.dart';
import 'package:rickandmorty/app/inject_dependency.dart';

import 'app/my_app.dart';

void main() {
   injectDependecies();
  runApp(
    const MyApp(),
  );
}
