import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../widgets/widgets.dart';

class {{featureName.pascalCase()}}Page extends StatelessWidget {
  const {{featureName.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<{{featureName.pascalCase()}}Bloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<{{featureName.pascalCase()}}Bloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              // Top half
              BlocBuilder<{{featureName.pascalCase()}}Bloc, {{featureName.pascalCase()}}State>(
                builder: (context, state) {
                  if (state is Empty) {
                    return const MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is Loading) {
                    return const LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay({{featureName.camelCase()}}: state.trivia);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 20),
              // Bottom half
              const TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}
