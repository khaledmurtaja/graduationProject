const emailIsRequiredMessage="حقل البريد الالكتروني مطلوب";
const wrongEmailFormatMessage="للبريد الالكتروني غير صالح";
const passwordIsRequiredMessage="حقل كلمة المرور مطلوب";
const lessThan8charMessage="كلمة السر يجب أن تحتوي  8 احرف على الاقل";
const atLeast1UpperCaseLetterMessage="يجب ان تحتوي كلمة السر على حرف كبير واحد على الاقل";
const atLeast1LowerCaseLetterMessage="يجب ان تحتوي كلمة السر على حرف صغير واحد على الاقل";
const atLeast1NumberMessage="يجب ان تحتوي كلمة السر على رقم  واحد على الاقل";
const atLeast1SpecialCharacterMessage="يجب ان تحتوي على رموز مثل @&\$^#+_";
const nameIsRequiredMessage=" حقل الاسم مطلوب";
const unMatchedPasswordsMessage="كلمتا المرورر غير متوافقتين";
const nameMustHave4LettersAtLeastMessage="حقل الاسم يجب ان يحتوي اربعة احرف على الاقل";
const nameMustHave30LettersAtMostMessage="حقل الاسم لا يمكن ان يتجاوز ثلاثون حرفا";
const lessThat200CharRequiredMessage="الوصف لا يمكن أن يتجاز ٢٠٠ حرف";
final RegExp uppercaseRegex = RegExp(r'[A-Z]');
final RegExp lowercaseRegex = RegExp(r'[a-z]');
final RegExp numberRegex = RegExp(r'[0-9]');
final RegExp specialCharRegex = RegExp(r'[!@#\$%\^&\*\(\)_\+<>\?/\|\\~\[\]\{\}]');


