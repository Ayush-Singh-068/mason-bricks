import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

@immutable
abstract class {{featureName.pascalCase()}}State extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends {{featureName.pascalCase()}}State {}

class Loading extends {{featureName.pascalCase()}}State {}

class Loaded extends {{featureName.pascalCase()}}State {
  final {{featureName.pascalCase()}} trivia;

  Loaded({required this.trivia});

  @override
  List<Object> get props => [trivia];
}

class Error extends {{featureName.pascalCase()}}State {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
