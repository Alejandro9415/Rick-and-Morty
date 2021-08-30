import 'package:rickandmorty/app/domain/models/rick_model.dart';

abstract class ApiRepository {
  Future<List<RickModel>> rickApi(String url, int id);
}
