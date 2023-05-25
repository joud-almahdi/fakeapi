import 'package:flutterapipracticesirin/languages/en.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'ar.dart';

String ara = 'ar';
String ene = 'en';
String frf = 'fr';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
      };
}
