import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/entities.dart';

abstract class {{featureName.pascalCase()}}Repository {
  Future<Either<Failure, {{featureName.pascalCase()}}>> getConcrete{{featureName.pascalCase()}}(int number);
  Future<Either<Failure, {{featureName.pascalCase()}}>> getRandom{{featureName.pascalCase()}}();
}
