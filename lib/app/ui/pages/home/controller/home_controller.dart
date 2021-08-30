import 'dart:math';

import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:rickandmorty/app/data/repositories_impl/api_repository_impl.dart';
import 'package:rickandmorty/app/domain/models/rick_model.dart';
import 'package:rickandmorty/app/utils/constantes.dart';

class HomeController extends SimpleNotifier {
  List<RickModel> datosList = [];
  int current = 1;

  void increment() {
    current++;

    notify();
  }

  void decrement() {
    current--;
    notify();
  }

  void fetchData() async {
    final api = Get.i.find<ApiRepositoryImpl>();
    datosList = await api.rickApi(BASE_URL, current);
    notify();
  }
}
