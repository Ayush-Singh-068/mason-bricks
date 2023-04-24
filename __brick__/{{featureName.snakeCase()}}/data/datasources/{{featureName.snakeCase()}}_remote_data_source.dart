import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/error.dart';
import '../models/models.dart';

abstract class {{featureName.pascalCase()}}RemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<{{featureName.pascalCase()}}Model> getConcrete{{featureName.pascalCase()}}(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<{{featureName.pascalCase()}}Model> getRandom{{featureName.pascalCase()}}();
}

class {{featureName.pascalCase()}}RemoteDataSourceImpl implements {{featureName.pascalCase()}}RemoteDataSource {
  final http.Client client;

  {{featureName.pascalCase()}}RemoteDataSourceImpl({required this.client});

  @override
  Future<{{featureName.pascalCase()}}Model> getConcrete{{featureName.pascalCase()}}(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<{{featureName.pascalCase()}}Model> getRandom{{featureName.pascalCase()}}() =>
      _getTriviaFromUrl('http://numbersapi.com/random');

  Future<{{featureName.pascalCase()}}Model> _getTriviaFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return {{featureName.pascalCase()}}Model.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
