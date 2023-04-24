import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetRandom{{featureName.pascalCase()}} implements UseCase<{{featureName.pascalCase()}}, NoParams> {
  final {{featureName.pascalCase()}}Repository repository;

  GetRandom{{featureName.pascalCase()}}(this.repository);

  @override
  Future<Either<Failure, {{featureName.pascalCase()}}>> call(NoParams params) async {
    return await repository.getRandom{{featureName.pascalCase()}}();
  }
}
