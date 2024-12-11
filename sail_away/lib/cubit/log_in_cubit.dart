import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sail_away/data/model/allergy.dart';
import 'package:sail_away/data/model/product.dart';
import 'package:sail_away/data/repository.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final Repo repo;
  LogInCubit(this.repo) : super(LogIn());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      final uid = user!.uid;
      repo.saveUserId(uid);

      emit(MoveToMainScreen());
    } on FirebaseAuthException catch (e) {
      emit(Error('Błąd logowania: ${e.code}'));
    }
  }

  Future<void> registerUser(String name, String email, String password) async {
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      final uid = user!.uid;
      repo.saveUserId(uid);
      repo.creatUserInDB(uid, name, email);

      List<ProductModel> products = await repo.getAllProductFromDB();
      List<AllergyModel> allergies = await repo.getAllAllergiesFromDB();

      await response.user!.sendEmailVerification();

      emit(RegisterPart2(products, allergies));
    } on FirebaseAuthException catch (e) {
      emit(Error('Błąd logowania: ${e.code}'));
    }
  }

  Future<void> registerUserPreferences(
      List<AllergyModel> alleriges, List<ProductModel> products) async {
    List<String> productsIds = [];
    List<String> allergiesIds = [];

    for (var e in products) {
      productsIds.add(e.id);
    }

    for (var e in alleriges) {
      allergiesIds.add(e.id);
    }

    String userId = await repo.loadUserId();

    repo.creatUserPrefernces(userId, productsIds, allergiesIds);
    emit(MoveToMainScreen());
  }

  Future<void> moveToRegistration() async {
    emit(RegisterPart1());
  }

  Future<void> moveToLogIn() async {
    emit(LogIn());
  }

  Future<void> recoverPassword(email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      emit(const Error('error przy restarcie'));
      print(e);
    }
  }
  
}
