 
import 'package:news_app/core/storage/shared_pref_manger.dart';

import '../shared/shared.dart';
 
class LangProvider extends ChangeNotifier {
  String currentLang = SharedPrefsHelper.getCurrentLang();

  bool get isEnglish => currentLang == 'en';
  void changeLang(String newLang) {
    if (currentLang == newLang) return;
    currentLang = newLang;
    SharedPrefsHelper.saveCurrentLang(currentLang);
    notifyListeners();
  }
}
