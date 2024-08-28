import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/translations/en.dart';
import 'package:ultimate_spyfall/app_local/translations/fr.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'fr': fr,
      };
}
