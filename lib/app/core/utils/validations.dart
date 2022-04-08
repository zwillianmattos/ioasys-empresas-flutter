class EmailValidator {
  static String? valdiate(String? email) {
    if (email == null || email.length == 0) {
      return "Informe um email";
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) {
      return "Endereço de email inválido";
    }

    return null;
  }
}
