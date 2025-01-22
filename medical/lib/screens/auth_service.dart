import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _logger = Logger('AuthService');

  Future<User?> createUserwithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _logger.info('User created successfully');
      return cred.user; // Return the User object
    } catch (e) {
      _logger.warning('Something went wrong during account creation: $e');
      return null;
    }
  }

  Future<User?> loginUserwithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password); // Await here
      _logger.info('User logged in successfully');
      return cred.user; // Return the User object
    } catch (e) {
      _logger.warning('Something went wrong during login: $e');
      return null;
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
      _logger.info("User signed out successfully");
    } catch (e) {
      _logger.warning("Something went wrong during sign out: $e");
    }
  }
}
