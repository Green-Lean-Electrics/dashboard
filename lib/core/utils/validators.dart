class Validators {
  static String lengthValidator(String input){
    if(input.trim().length < 3){
      return 'Too short input';
    }
    return null;
  }

  static String numberValidator(String input){
    if(input.trim().length == 0 || double.tryParse(input.trim()) == null){
      return 'Not a valid price';
    }
    return null;
  }
}