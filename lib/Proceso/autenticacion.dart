import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth fire = FirebaseAuth.instance;
  final email01 = 'user01@mailto.com';
  final email02 = 'user02@mailto.com';
  final password01 = '12345678';
  final password02 = '12345678';
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

  Future<void> loginUser01(
      {required String email, required String password}) async {
    try {
      await fire.signInWithEmailAndPassword(
          email: email01, password: password01);
    } on FirebaseAuthMultiFactorException catch (e) {
      print(e.code);
    }
  }

  Future<void> loginUser02(
      {required String email, required String password}) async {
    try {
      await fire.signInWithEmailAndPassword(
          email: email02, password: password02);
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
