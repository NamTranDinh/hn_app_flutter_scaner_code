class Validator {
  static bool isEmail(String? input) {
    final RegExp regex = RegExp(r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return regex.hasMatch(input ?? '');
  }

  static bool isWebsite(String? input) {
    final RegExp regex = RegExp(r'^(?:http|https)://[\w\-]+(\.[\w\-]+)+[\w\-.,@?^=%&:/~+#]*[\w\-@?^=%&/~+#]$');
    return regex.hasMatch(input ?? '');
  }

  static bool isPhoneNumber(String? input) {
    final RegExp regex = RegExp(r'^\+\d{1,3}\d{6,14}$');
    return regex.hasMatch(input ?? '');
  }
}
