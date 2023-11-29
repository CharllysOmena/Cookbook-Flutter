import 'package:cookbook/app/modules/home/data/models/categoria.dart';

abstract interface class CategoriaState {}

class StartCategoriaState implements CategoriaState {
  const StartCategoriaState();
}

class SuccessCategoriaState implements CategoriaState {
  final List<Categoria> categorias;
  const SuccessCategoriaState({required this.categorias});
}

class ErrorExceptionCategoriaState implements CategoriaState {
  const ErrorExceptionCategoriaState();
}

class LoadingCategoriaState implements CategoriaState {
  const LoadingCategoriaState();
}

class EmptyCategoriaState implements CategoriaState {
  const EmptyCategoriaState();
}
