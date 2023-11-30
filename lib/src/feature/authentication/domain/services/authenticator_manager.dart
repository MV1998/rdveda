
import 'package:rdveda/src/feature/authentication/domain/repository/authentication.dart';

class AuthenticatorManager {
  Authentication authentication;

  AuthenticatorManager(this.authentication);

  void authenticate() {
    authentication.signIn();
  }
}