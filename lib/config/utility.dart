

abstract class Utils {


  //create the validation utils for number
  static String? validateNumber(String? value) {
    //if value is null or is empty
    if(value == null || value.isEmpty) {
      return "The phone number field must not be empty";
    }
    //if value does not match regex
    RegExp validPhone = RegExp(r'^(\+233|233|0)[0-9]{9}$');
    if(!validPhone.hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }
}