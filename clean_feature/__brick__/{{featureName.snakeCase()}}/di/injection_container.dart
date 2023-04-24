import 'package:get_it/get_it.dart';

import '../data/datasources/datasources.dart';
import '../data/repositories/repositories.dart';
import '../domain/repositories/repositories.dart';
import '../domain/usecases/usecases.dart';
import '../presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
        () => {{featureName.pascalCase()}}Bloc(
      concrete: sl(),
      inputConverter: sl(),
      random: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetConcrete{{featureName.pascalCase()}}(sl()));
  sl.registerLazySingleton(() => GetRandom{{featureName.pascalCase()}}(sl()));

  // Repository
  sl.registerLazySingleton<{{featureName.pascalCase()}}Repository>(
        () => {{featureName.pascalCase()}}RepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<{{featureName.pascalCase()}}RemoteDataSource>(
        () => {{featureName.pascalCase()}}RemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<{{featureName.pascalCase()}}LocalDataSource>(
        () => {{featureName.pascalCase()}}LocalDataSourceImpl(sharedPreferences: sl()),
  );
}
