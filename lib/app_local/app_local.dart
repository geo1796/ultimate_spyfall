import 'package:get/get.dart';

abstract class AppLocal {
  static get localeName => Get.deviceLocale?.languageCode ?? 'en';

  static get home => 'home'.tr;

  static get players => 'players'.tr;

  static get locations => 'locations'.tr;

  static get settings => 'settings'.tr;

  static get playerName => 'playerName'.tr;

  static get tooShort => 'tooShort'.tr;

  static get alreadyUsed => 'alreadyUsed'.tr;

  static get cancel => 'cancel'.tr;

  static get newLocationGroup => 'newLocationGroup'.tr;

  static get location => 'location'.tr;

  static get spyCount => 'spyCount'.tr;

  static get prankMode => 'prankMode'.tr;

  static get coopSpies => 'coopSpies'.tr;

  static get fixedSpies => 'fixedSpies'.tr;

  static get randomSpies => 'randomSpies'.tr;

  static get play => 'play'.tr;

  static get spy => 'spy'.tr;

  static get prankChances => 'prankChances'.tr;

  static get revealSpies => 'revealSpies'.tr;

  static get showLocations => 'showLocations'.tr;

  static get restart => 'restart'.tr;

  static get spies => 'spies'.tr;

  static get listName => 'listName'.tr;

  static get submit => 'submit'.tr;

  static get showSettings => 'showSettings'.tr;

  static get no => 'no'.tr;

  static get yes => 'yes'.tr;
}
