import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sail_away/data/repository.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final Repo repo;
  LogInCubit(this.repo) : super(LogIn());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(const Error('mamy to '));
    } on FirebaseAuthException catch (e) {
      emit(Error('Błąd logowania: ${e.code}'));
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      emit(const Error('mamy to rejestracja'));
    } on FirebaseAuthException catch (e) {
      emit(Error('Błąd logowania: ${e.code}'));
    }
  }

  Future<void> moveToRegistration() async {
    emit(RegisterPart1());
  }

  Future<void> moveToLogIn() async {
    emit(LogIn());
  }
}
