import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_locale/translations/en.dart';
import 'package:ultimate_spyfall/app_locale/translations/fr.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'fr': fr,
      };
}
