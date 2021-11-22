import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rickandmorty/app/domain/models/rick_model.dart';
import 'package:rickandmorty/app/domain/repositories/api_repository.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/app/failure/app_error.dart';

class ApiRepositoryImpl implements ApiRepository {
  @override
  Future<Either<AppError, List<RickModel>>> rickApi(String url, id) async {
    try {
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
      return Right(morty);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
