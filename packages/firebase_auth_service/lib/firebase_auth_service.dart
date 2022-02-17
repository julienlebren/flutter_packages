library firebase_auth_service;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

/// A provider which returns the auth changes in Firebase
/// We use a [StreamProvider] here to handle the status of the stream,
/// it allows us to know when the stream is loading or when it has data.
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges());

/// A provider which returns an instance of [FirebaseAuthService]
final authServiceProvider =
    Provider<FirebaseAuthService>((ref) => FirebaseAuthService.instance);

/// The service managing authentication with Firebase
class FirebaseAuthService {
  FirebaseAuthService._();

  static final instance = FirebaseAuthService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<Map<String, dynamic>> parsePhoneNumber(
    CountryWithPhoneCode country,
    String inputText,
  ) async {
    final formattedNumber =
        '+${country.phoneCode}${inputText.replaceAll(RegExp(r'[^0-9]'), '')}';

    final phoneNumber = await FlutterLibphonenumber().parse(
      formattedNumber,
      region: country.countryCode,
    );

    if (phoneNumber['type'] != 'mobile') {
      FirebaseAuthException(code: 'ERROR_PHONE_NOT_MOBILE');
    }

    return phoneNumber;
  }

  Future<void> verifyPhone(
      String phoneNumber, Function(String verificationId) completion) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (AuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseException e) {
        throw e;
      },
      codeSent: (String verificationId, int? resendToken) {
        completion(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completion(verificationId);
      },
      timeout: Duration(seconds: 60),
    );
  }

  Future<User?> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<User?> signInWithApple() async {
    final scopes = [Scope.email, Scope.fullName];

    final result = await TheAppleSignIn.performRequests(
      [AppleIdRequest(requestedScopes: scopes)],
    );

    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken!),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = appleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw FirebaseAuthException(
          code: 'ERROR_AUTHORIZATION_DENIED',
        );

      case AuthorizationStatus.cancelled:
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
        );
      default:
        throw UnimplementedError();
    }
  }

  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(code: 'ERROR_MISSING_GOOGLE_ID_TOKEN');
      }
    } else {
      throw FirebaseAuthException(code: 'ERROR_ABORTED_BY_USER');
    }
  }

  Future<User?> signInWithFacebook() async {
    final fb = FacebookLogin();
    final response = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (response.status) {
      case FacebookLoginStatus.success:
        final accessToken = response.accessToken;
        final userCredential = await _firebaseAuth.signInWithCredential(
          FacebookAuthProvider.credential(accessToken!.token),
        );
        return userCredential.user;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(code: 'ERROR_ABORTED_BY_USER');
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(code: 'ERROR_FACEBOOK_LOGIN_FAILED');
      default:
        throw UnimplementedError();
    }
  }

  Future<void> sendSignInLinkToEmail({
    required String email,
    required String url,
  }) async {
    await _firebaseAuth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: url,
        handleCodeInApp: true,
      ),
    );
  }

  Future<User?> signInWithEmailLink({
    required String email,
    required String emailLink,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailLink(
      email: email,
      emailLink: emailLink,
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}
