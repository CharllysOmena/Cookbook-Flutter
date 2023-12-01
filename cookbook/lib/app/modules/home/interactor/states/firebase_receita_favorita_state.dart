import 'package:cookbook/app/modules/home/data/models/receita.dart';

abstract interface class FirebaseReceitaFavoritaState {}

class StartFirebaseReceitaFavoritaState
    implements FirebaseReceitaFavoritaState {
  const StartFirebaseReceitaFavoritaState();
}

class SuccessGetFirebaseReceitaFavoritaState
    implements FirebaseReceitaFavoritaState {
  final List<Receita> receitas;
  const SuccessGetFirebaseReceitaFavoritaState({required this.receitas});
}

class SuccessFirebaseReceitaFavoritaState
    implements FirebaseReceitaFavoritaState {
  const SuccessFirebaseReceitaFavoritaState();
}

class ErrorExceptionFirebaseReceitaFavoritaState
    implements FirebaseReceitaFavoritaState {
  const ErrorExceptionFirebaseReceitaFavoritaState();
}

class LoadingFirebaseReceitaFavoritaState
    implements FirebaseReceitaFavoritaState {
  const LoadingFirebaseReceitaFavoritaState();
}

class EmptyFirebaseReceitaFavoritaState
    implements FirebaseReceitaFavoritaState {
  const EmptyFirebaseReceitaFavoritaState();
}
