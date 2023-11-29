import '../../data/models/comida.dart';

abstract interface class ComidaState {}

class StartComidaState implements ComidaState {
  const StartComidaState();
}

class SuccessComidaState implements ComidaState {
  final List<Comida> comidas;
  const SuccessComidaState({required this.comidas});
}

class ErrorExceptionComidaState implements ComidaState {
  const ErrorExceptionComidaState();
}

class LoadingComidaState implements ComidaState {
  const LoadingComidaState();
}

class EmptyComidaState implements ComidaState {
  const EmptyComidaState();
}
