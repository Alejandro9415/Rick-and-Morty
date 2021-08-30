import 'dart:convert';

import 'package:rickandmorty/app/domain/models/rick_model.dart';
import 'package:rickandmorty/app/domain/repositories/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiRepositoryImpl implements ApiRepository {
  @override
  Future<List<RickModel>> rickApi(String url, id) async {
    final client = http.Client();
    List<RickModel> morty = [];

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final uri = Uri.parse('$url/character/?page=$id');
    final response = await client.get(uri, headers: headers);

    final body = const Utf8Decoder().convert(response.bodyBytes);
    final data = jsonDecode(body);
    final result = data['results'] as List;
    morty = result.map((e) => RickModel.fromJson(e)).toList();
    return morty;
  }
}
