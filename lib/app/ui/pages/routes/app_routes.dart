import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:rickandmorty/app/ui/pages/home/home_page.dart';
import 'package:rickandmorty/app/ui/pages/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.HOME_PAGE: (_) => const HomePage(),
    };
