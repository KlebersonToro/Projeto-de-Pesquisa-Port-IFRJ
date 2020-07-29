bool emailValid(String email){
  final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
  return regex.hasMatch(email);
}


//? Traduzir caso usar telefone
String validateMobile(String value) {
String patttern = r'^\([1-9]{2}\) (?:[2-8]|9[1-9])[0-9]{3}\-[0-9]{4}$';
RegExp regExp = new RegExp(patttern);
if (value.length == 0) {
      return 'Preencha o número de telefone/celular';
}
else if (!regExp.hasMatch(value)) {
      return 'Preencha um número de telefone/celular válido';
}
return null;
}   