
import 'package:news_app/core/shared/shared.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          routes: RoutesManager.routes,
          initialRoute: RoutesManager.homeScreen,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          darkTheme: ThemeManger.dark,
          theme: ThemeManger.light,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: [Locale('en'), Locale('ar'), Locale('es')],
          locale: Locale('en'),
        );
      },
    );
  }
}
