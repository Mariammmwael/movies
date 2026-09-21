import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseFunction {
  static void register(
    String name,
    String email,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user!.sendEmailVerification();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
      print(e.toString());
    }
  }

  static Future<void> login(
    String name,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: name,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      onError(e.toString());
      print(e.toString());
    }
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      print('Google Sign-In error: ${e.code}');
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<String?> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 'The email is not valid';
        case 'user-not-found':
          return 'No account found with this email';
        case 'too-many-requests':
          return 'Too many attempts, try again later';
        case 'network-request-failed':
          return 'No internet connection';
        default:
          return e.message ?? 'Something went wrong';
      }
    } catch (e) {
      return 'Something went wrong';
    }
  }
}
