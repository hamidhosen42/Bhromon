import 'package:get/get.dart';

import '../views/languages/ban.dart';
import '../views/languages/eng.dart';
class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}