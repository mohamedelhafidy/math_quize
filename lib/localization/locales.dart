import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.EN),
  MapLocale("ar", LocaleData.AR),
];

mixin LocaleData {
  static const String nameApp = 'nameApp';
  static const String gePDF = 'gePDF';
  static const String geQUIZ = 'geQUIZ';
  static const String quiz = 'quiz';
  static const String goBack = 'goBACK';
  static const String send = 'send';
  static const String lblName = 'lblName';
  static const String lblEmail = 'lblEmail';
  static const String lblMessage = 'lblMessage';

  static const String titleHome = 'titleHome';
  static const String titleContact = 'titleContact';
  static const String titleMoreApps = 'titleMoreApps';
  static const String titleExitApp = 'titleExitApp';
  static const String titleAnswer = 'titleAnswer';

  static const String msgErrorName = 'msgErrorName';
  static const String msgErrorMessage = 'msgErrorMessage';
  static const String msgErrorEmail = 'msgErrorEmail';
  static const String msgErrorEmail2 = 'msgErrorEmail2';

  static const String chooseAnyOne = 'chooseAnyOne';
  static const String questionLengthName = 'questionLengthName';
  static const String startValue = 'startValue';
  static const String endValueName = 'endValueName';
  static const String timeName = 'timeName';
  static const String yourScore = 'yourScore';
  static const String outOf = 'outOf';
  static const String goToHome = 'goToHome';
  static const String checkYourAnswer = 'checkYourAnswer';
  static const String nameDev = 'Mohamed Elhafidy';
  static const String email = 'elhafidymoh@gmail.com';

  static const Map<String, dynamic> EN = {
    nameApp: 'MATH QUIZ',
    gePDF: 'Generate PDF File',
    geQUIZ: 'Generate Quiz',
    quiz: "Quiz",
    goBack: "BACK",
    send: "Send",
    lblName: "Name",
    lblEmail: "Email Address",
    lblMessage: "Message",
    titleHome: "HOME",
    titleContact: "CONTACT US",
    titleMoreApps: "MORE APPS BY ME",
    titleExitApp: "EXIT THE APP",
    titleAnswer: "ANSWER : ",
    msgErrorName: "Name is required.",
    msgErrorMessage: "Message is required.",
    msgErrorEmail: "Email is required.",
    msgErrorEmail2: "Please enter a valid email address.",
    chooseAnyOne: "Choose Any One",
    questionLengthName: "How many questions do you want in the quiz? (1-50)",
    startValue: "Start value",
    endValueName: "End value",
    timeName: "Time ",
    yourScore: "YOUR SCORE IS ",
    outOf: "OUT OF",
    goToHome: 'Go To Home -->',
    checkYourAnswer: "CHECK YOUR ANSWER",
    nameDev: "Mohamed Elhafidy",
    email: "elhafidymoh@gmail.com"
  };

  static const Map<String, dynamic> AR = {
    nameApp: 'MATH QUIZ',
    gePDF: 'توليد ملف PDF',
    geQUIZ: 'إنشاء اختبار',
    quiz: "اختبار",
    goBack: "خلف",
    send: "إرسال",
    lblName: "الإسم",
    lblEmail: "البريد الإلكتروني",
    lblMessage: "الرسالة",
    titleHome: "الرئيسية",
    titleContact: "اتصل بنا",
    titleMoreApps: "المزيد من التطبيقات من قبلي",
    titleExitApp: "اخرج من التطبيق",
    titleAnswer: "إجابة :",
    msgErrorName: "الإسم مطلوب",
    msgErrorMessage: "الرسالة مطلوبة.",
    msgErrorEmail: "البريد الالكتروني مطلوب.",
    msgErrorEmail2: "يرجى إدخال عنوان بريد إلكتروني صالح.",
    chooseAnyOne: "اختر أي واحد",
    questionLengthName: "كم عدد الأسئلة التي تريدها في المسابقة؟ (1-50)",
    startValue: "قيمه البدايه",
    endValueName: "القيمة النهائية",
    timeName: "وقت",
    yourScore: "عدد إجاباتك الصحيحة هي",
    outOf: "من ",
    goToHome: 'اذهب إلى الرئيسية -->',
    checkYourAnswer: "تحقق من إجابتك",
    nameDev: "Mohamed Elhafidy",
    email: "elhafidymoh@gmail.com"
  };
}
