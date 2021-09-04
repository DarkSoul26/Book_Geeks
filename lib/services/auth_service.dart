import 'package:book_geeks/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserAttributes _userFromFirebase(user) {
    if (user == null) {
      return null;
    }
    return UserAttributes(user.uid, user.email);
  }

  Stream<UserAttributes> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserAttributes> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<UserAttributes> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
