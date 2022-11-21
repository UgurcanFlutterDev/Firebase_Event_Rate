import 'package:get/get.dart';

class Validators {
  static String? isEmpty(String? value, {String? errorText}) {
    if (value == null || value.isEmpty) {
      return errorText ?? "cantBeEmpty".tr;
    }
    return null;
  }
}
