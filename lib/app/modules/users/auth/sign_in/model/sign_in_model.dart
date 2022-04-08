class SignInModel {
  String? email;
  String? password;

  SignInModel({
    this.email,
    this.password,
  });

  toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
