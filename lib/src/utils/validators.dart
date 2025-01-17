//TAKES STRING AND RETURNS VALIDATIONS
class Validators {
  static final RegExp _phoneRegex = RegExp(r'^01\d{9}$');
  static String? validatePhoneNumber(String? value) {
    //11 digits and has to start with 01
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!_phoneRegex.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? nonEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }
}
