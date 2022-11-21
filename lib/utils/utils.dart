import 'package:eventrate/features/auth-features/login/model/user_model.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';

class Utils {
  static u.User convertFirebaseUserToUserModel(User cred) {
    final u.User user = u.User(
      displayName: cred.displayName,
      email: cred.email,
      emailVerified: cred.emailVerified,
      isAnonymous: cred.isAnonymous,
      phoneNumber: cred.phoneNumber,
      photoUrl: cred.phoneNumber,
      refreshToken: cred.refreshToken,
      tenantId: cred.tenantId,
      uid: cred.uid,
    );
    return user;
  }
}
