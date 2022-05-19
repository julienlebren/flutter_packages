part of '../sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  static final instance = FirebaseAuthService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();
  Stream<User?> userChanges() => _firebaseAuth.userChanges();

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
      throw FirebaseAuthException(code: 'phone-not-mobile');
    }

    return phoneNumber;
  }

  Future<void> verifyPhone(
    String phoneNumber,
    Function(String verificationId) completion,
  ) async {
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
      timeout: const Duration(seconds: 60),
    );
  }

  Future<User?> verifyCode(
    String verificationId,
    String verificationCode,
  ) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User?> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<UserCredential> _signInWithCredential(
      AuthCredential credential) async {
    if (currentUser != null) {
      final isAnonymous = currentUser!.isAnonymous;
      final userCredential = await currentUser!.linkWithCredential(credential);

      if (isAnonymous) {
        await updateEmail(userCredential.user!.email!);
      }
      return userCredential;
    } else {
      return await _firebaseAuth.signInWithCredential(credential);
    }
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
        final userCredential = await _signInWithCredential(credential);

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
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        final userCredential = await _signInWithCredential(credential);
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
        final credential = FacebookAuthProvider.credential(accessToken!.token);

        final userCredential = await _signInWithCredential(credential);
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

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (currentUser != null) {
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      final userCredential = await _signInWithCredential(credential);
      return userCredential.user;
    } else {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> updateEmail(String newEmail) async {
    final result = await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('updateUserEmail')
        .call({'email': newEmail});

    await _firebaseAuth.signInWithCustomToken(result.data);
  }

  Future<void> updatePassword(String newPassword) async {
    final result = await FirebaseFunctions.instanceFor(region: 'europe-west3')
        .httpsCallable('updateUserPassword')
        .call({'password': newPassword});

    await _firebaseAuth.signInWithCustomToken(result.data);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User> unlink(String providerId) async {
    return await currentUser!.unlink(providerId);
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}
