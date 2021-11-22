import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:rickandmorty/app/data/repositories_impl/api_repository_impl.dart';
import 'package:rickandmorty/app/domain/models/rick_model.dart';
import 'package:rickandmorty/app/failure/app_error.dart';
import 'package:rickandmorty/app/utils/constantes.dart';

class HomeController extends SimpleNotifier {
  List<RickModel> datosList = [];
  Either<AppError, List<RickModel>> data = right([]);
  int current = 1;
  String mensaje = '';

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
    data = await api.rickApi(BASE_URL, current);
    data.fold((l) => mensaje = l.appErrorType.toString(), (r) => datosList = r);
    notify();
  }
}
