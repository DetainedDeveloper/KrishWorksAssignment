abstract class InputChecker {
  static Future<bool> isValid({required List<String?> inputs}) async {
    bool isValid = false;
    inputs.forEach(
      (input) {
        if (input != null) {
          if (input.isNotEmpty) {
            isValid = true;
          } else {
            isValid = false;
            return;
          }
        } else {
          isValid = false;
          return;
        }
      },
    );
    return isValid;
  }
}
