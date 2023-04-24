import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

class TriviaDisplay extends StatelessWidget {
  final {{featureName.pascalCase()}} {{featureName.camelCase()}};

  const TriviaDisplay({
    Key? key,
    required this.{{featureName.camelCase()}},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            {{featureName.camelCase()}}.number.toString(),
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  {{featureName.camelCase()}}.text,
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
