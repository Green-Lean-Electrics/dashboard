class Validators {
  static String lengthValidator(String input){
    if(input.trim().length < 3){
      return 'Too short input';
    }
    return null;
  }
}