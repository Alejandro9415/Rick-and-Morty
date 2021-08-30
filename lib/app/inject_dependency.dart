import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:rickandmorty/app/data/repositories_impl/api_repository_impl.dart';
import 'package:rickandmorty/app/domain/repositories/api_repository.dart';

 injectDependecies() {
  Get.i.put(ApiRepositoryImpl());
}
