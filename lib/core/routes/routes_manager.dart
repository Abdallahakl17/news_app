 import 'package:news_app/feature/home/home_screen.dart';

import '../shared/shared.dart';

abstract class RoutesManager {
  static const homeScreen = '/homeScreen';

  static Map<String ,WidgetBuilder>routes={
     homeScreen:(_)=>HomeScreen()
  };
}
