import 'dart:async';
import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/entities.dart';
import 'package:bloc/bloc.dart';
import '../../../../core/util/util.dart';
import '../../domain/usecases/usecases.dart';
import '../bloc/bloc.dart';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class {{featureName.pascalCase()}}Bloc extends Bloc<{{featureName.pascalCase()}}Event,{{featureName.pascalCase()}}State> {
  final GetConcrete{{featureName.pascalCase()}} _getConcrete{{featureName.pascalCase()}};
  final GetRandom{{featureName.pascalCase()}} _getRandom{{featureName.pascalCase()}};
  final InputConverter inputConverter;

  {{featureName.pascalCase()}}Bloc({
    required GetConcrete{{featureName.pascalCase()}} concrete,
    required GetRandom{{featureName.pascalCase()}} random,
    required this.inputConverter,
  })  : _getConcrete{{featureName.pascalCase()}} = concrete, _getRandom{{featureName.pascalCase()}} = random,super(Empty()){
    on<GetTriviaForConcreteNumber>(_concreteTriviaEventHandler);

    on<GetTriviaForRandomNumber>(_randomTriviaEventHandler);
  }
  Future<void> _concreteTriviaEventHandler(
      GetTriviaForConcreteNumber event,
      Emitter<{{featureName.pascalCase()}}State> emit,
      ) async {
    final stringNumber = event.numberString;

    final inputEither = inputConverter.stringToUnsignedInteger(stringNumber);

    await inputEither.fold(
          (_) async => emit(
        Error(
          message: INVALID_INPUT_FAILURE_MESSAGE,
        ),
      ),
          (parsedNumber) async {
        emit(Loading());

        final params = Params(number: parsedNumber);
        final either = await _getConcrete{{featureName.pascalCase()}}(params);

        _emit{{featureName.pascalCase()}}RetrievalResult(either, emit);
      },
    );
  }

  Future<void> _randomTriviaEventHandler(
      GetTriviaForRandomNumber event,
      Emitter<{{featureName.pascalCase()}}State> emit,
      ) async {
    emit(Loading());

    final either = await _getRandom{{featureName.pascalCase()}}(NoParams());

    _emit{{featureName.pascalCase()}}RetrievalResult(either, emit);
  }

  String _mapFailureToMessage(Failure failure) {
    late final String failureMessage;

    switch (failure.runtimeType) {
      case ServerFailure:
        failureMessage = SERVER_FAILURE_MESSAGE;

        break;

      case CacheFailure:
        failureMessage = CACHE_FAILURE_MESSAGE;

        break;

      default:
        failureMessage = 'Unexpected error';

        break;
    }

    return failureMessage;
  }

  void _emit{{featureName.pascalCase()}}RetrievalResult(
      Either<Failure, {{featureName.pascalCase()}}> either,
      Emitter<{{featureName.pascalCase()}}State> emit,
      ) async {
    await either.fold(
          (failure) async {
        emit(
          Error(
            message: _mapFailureToMessage(failure),
          ),
        );
      },
          (trivia) async {
        emit(
          Loaded(
            trivia: trivia,
          ),
        );
      },
    );
  }
}