import '../../domain/entities/entities.dart';

class {{featureName.pascalCase()}}Model extends {{featureName.pascalCase()}} {
  {{featureName.pascalCase()}}Model({
    required String text,
    required int number,
  }) : super(text: text, number: number);

  factory {{featureName.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{featureName.pascalCase()}}Model(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
