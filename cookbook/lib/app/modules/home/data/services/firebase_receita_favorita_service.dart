import 'package:cookbook/app/modules/home/data/adapters/receitas_adapter.dart';
import 'package:cookbook/app/modules/home/data/models/receita.dart';
import 'package:cookbook/app/modules/home/interactor/states/firebase_receita_favorita_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class IFirebaseReceitaFavoritaService {
  Stream<List<Receita>> get();
  Future<FirebaseReceitaFavoritaState> post(Receita receita);
  Future<FirebaseReceitaFavoritaState> delete(String id);
  Future<FirebaseReceitaFavoritaState> findById(String id);
}

class FirebaseReceitaFavoritaService
    implements IFirebaseReceitaFavoritaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference receitasCollection =
      FirebaseFirestore.instance.collection('receitas');

  @override
  Future<FirebaseReceitaFavoritaState> delete(String id) async {
    try {
      QuerySnapshot querySnapshot =
          await receitasCollection.where("id", isEqualTo: id).get();
      await receitasCollection.doc(querySnapshot.docs.first.id).delete();
      return const SuccessFirebaseReceitaFavoritaState();
    } catch (e) {
      return const ErrorExceptionFirebaseReceitaFavoritaState();
    }
  }

  @override
  Stream<List<Receita>> get() => receitasCollection
      .where("userId", isEqualTo: user!.uid)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ReceitaAdapter2.fromJson(doc.data()))
          .toList());

  @override
  Future<FirebaseReceitaFavoritaState> post(Receita receita) async {
    try {
      DocumentReference documentReference = await receitasCollection.add({
        'id': receita.id,
        'userId': user!.uid,
        'nome': receita.nome,
        'instrucoes': receita.instrucoes,
        'url': receita.url,
      });
      return const SuccessFirebaseReceitaFavoritaState();
    } catch (e) {
      return const ErrorExceptionFirebaseReceitaFavoritaState();
    }
  }

  @override
  Future<FirebaseReceitaFavoritaState> findById(String id) async {
    try {
      QuerySnapshot querySnapshot =
          await receitasCollection.where("id", isEqualTo: id).get();
      if (querySnapshot.docs.isNotEmpty) {
        return const SuccessFirebaseReceitaFavoritaState();
      } else {
        return const ErrorExceptionFirebaseReceitaFavoritaState();
      }
    } catch (e) {
      return const ErrorExceptionFirebaseReceitaFavoritaState();
    }
  }
}
