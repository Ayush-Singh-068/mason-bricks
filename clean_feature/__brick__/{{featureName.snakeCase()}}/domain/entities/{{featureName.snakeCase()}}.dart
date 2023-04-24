import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class {{featureName.pascalCase()}} extends Equatable {
  final String text;
  final int number;

  {{featureName.pascalCase()}}({
    required this.text,
    required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
