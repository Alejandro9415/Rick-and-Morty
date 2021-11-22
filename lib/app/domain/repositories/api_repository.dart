import 'package:dartz/dartz.dart';
import 'package:rickandmorty/app/domain/models/rick_model.dart';
import 'package:rickandmorty/app/failure/app_error.dart';

abstract class ApiRepository {
  Future<Either<AppError, List<RickModel>>> rickApi(String url, int id);
}
