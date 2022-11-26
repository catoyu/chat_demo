import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth fire = FirebaseAuth.instance;
  User? get usuario => fire.currentUser;
  Stream<User?> get estadoLogin =>
      fire.authStateChanges(); //Si el usuario esta activo o inactivo

  //Metodos

  Future<void> login({required String email, required String password}) async {
    try {
      await fire.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthMultiFactorException catch (e) {
      print(e.code);
    }
  }

  Future<void> newUser(
      {required String email, required String password}) async {
    try {
      await fire.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthMultiFactorException catch (e) {
      print(e.code);
    }
  }

  Future<void> signOut() async {
    try {
      await fire.signOut();
    } on FirebaseAuthMultiFactorException catch (e) {
      print(e.code);
    }
  }
}
