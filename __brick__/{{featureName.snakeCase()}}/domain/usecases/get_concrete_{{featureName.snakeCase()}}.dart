import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetConcrete{{featureName.pascalCase()}} implements UseCase<{{featureName.pascalCase()}}, Params> {
  final {{featureName.pascalCase()}}Repository repository;

  GetConcrete{{featureName.pascalCase()}}(this.repository);

  @override
  Future<Either<Failure, {{featureName.pascalCase()}}>> call(Params params) async {
    return await repository.getConcrete{{featureName.pascalCase()}}(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  List<Object> get props => [number];
}
