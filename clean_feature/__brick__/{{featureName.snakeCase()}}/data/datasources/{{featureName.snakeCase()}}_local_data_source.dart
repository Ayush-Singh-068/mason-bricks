import 'dart:convert';

import 'package:clean_brick/core/error/error.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

abstract class {{featureName.pascalCase()}}LocalDataSource {
  /// Gets the cached [{{featureName.pascalCase()}}Model] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<{{featureName.pascalCase()}}Model> getLast{{featureName.pascalCase()}}();

  Future<void> cache{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model triviaToCache);
}

const CACHED_{{featureName.constantCase()}} = 'CACHED_{{featureName.constantCase()}}';

class {{featureName.pascalCase()}}LocalDataSourceImpl implements {{featureName.pascalCase()}}LocalDataSource {
  final SharedPreferences sharedPreferences;

  {{featureName.pascalCase()}}LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<{{featureName.pascalCase()}}Model> getLast{{featureName.pascalCase()}}() {
    final jsonString = sharedPreferences.getString(CACHED_{{featureName.constantCase()}});
    if (jsonString != null) {
      return Future.value({{featureName.pascalCase()}}Model.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cache{{featureName.pascalCase()}}({{featureName.pascalCase()}}Model triviaToCache) {
    return sharedPreferences.setString(
      CACHED_{{featureName.constantCase()}},
      json.encode(triviaToCache.toJson()),
    );
  }
}
