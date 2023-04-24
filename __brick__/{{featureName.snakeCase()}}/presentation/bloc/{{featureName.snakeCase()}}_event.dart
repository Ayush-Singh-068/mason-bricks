import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class {{featureName.pascalCase()}}Event extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber extends {{featureName.pascalCase()}}Event {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString);

  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNumber extends {{featureName.pascalCase()}}Event {}
