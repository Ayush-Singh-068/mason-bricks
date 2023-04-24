import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../../../../core/network/network.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

typedef Future<{{featureName.pascalCase()}}> _ConcreteOrRandomChooser();

class {{featureName.pascalCase()}}RepositoryImpl implements {{featureName.pascalCase()}}Repository {
  final {{featureName.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{featureName.pascalCase()}}LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  {{featureName.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, {{featureName.pascalCase()}}>> getConcrete{{featureName.pascalCase()}}(
    int number,
  ) async {
    return await _getTrivia(() {
      return remoteDataSource.getConcrete{{featureName.pascalCase()}}(number);
    });
  }

  @override
  Future<Either<Failure, {{featureName.pascalCase()}}>> getRandom{{featureName.pascalCase()}}() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandom{{featureName.pascalCase()}}();
    });
  }

  Future<Either<Failure, {{featureName.pascalCase()}}>> _getTrivia(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cache{{featureName.pascalCase()}}(remoteTrivia as {{featureName.pascalCase()}}Model);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLast{{featureName.pascalCase()}}();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
