/*
* 用于校验的工具类
* */

// 邮箱校验
const String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
bool isEmail(String input) {
  if (input == null || input.isEmpty) return false;
  return RegExp(regexEmail).hasMatch(input);
}


//username校验
const String regexUsername = r'^[a-zA-Z]\w+$';
const String regexUsernamejudge = r'(?=.*?[A-Z])';
bool isUsername(String input) {
  if (input == null || input.isEmpty || input=='' || input.length < 5 || input.length > 11) return false;
  return (RegExp(regexUsername).hasMatch(input) && RegExp(regexUsernamejudge).hasMatch(input));
}

//password校验
const String regexPassword = r'^\w+$';
bool isPassword(String input) {
  if (input == null || input.isEmpty || input=='' || input.length < 6 || input.length > 13 ) return false;
  return (RegExp(regexPassword).hasMatch(input));
}

//Mobile校验
const String regexMobilenum = r'^1[3456789][0-9]+$';
bool isMobile(String input) {
  if ( ! ( input.length == 0 ) ){
    if(! ( input.length == 11 )) return false;
    return (RegExp(regexMobilenum).hasMatch(input));
  }
  else {
    return true;
  }
}

//Age校验 0-130岁
const String regexAge = r'^[0-9]?[0-9]$';
bool isAge(String input) {
  if ( ! ( input.length == 0 ) ){
    if(input.length >2 ) return false;
    return (RegExp(regexAge).hasMatch(input));
  }
  else {
    return true;
  }
}