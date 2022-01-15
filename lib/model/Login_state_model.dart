abstract class LoginAuthState {}

class InitialLoginAuthState extends LoginAuthState {}

class LoadingLoginAuthState extends LoginAuthState {}

class SuccesLoadLoginAuthState extends LoginAuthState {
  final String token;
  final String message;

  SuccesLoadLoginAuthState(this.token, this.message);

  @override
  String toString() {
    return 'SuccessLoadAllProductState{listProfiles: $token, message: $message}';
  }
}

class FailureLoadLoginAuthState extends LoginAuthState {
  final String errorMessage;

  FailureLoadLoginAuthState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
