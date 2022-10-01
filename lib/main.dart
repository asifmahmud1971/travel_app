import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:statusbarz/statusbarz.dart';
import 'package:travel_app/Controller/get_data.dart';
import 'package:travel_app/Helper/Color_me.dart';
import 'package:travel_app/routes/route.dart';

//SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        navigatorObservers: [Statusbarz.instance.observer],
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: Container(child: child),
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: IconThemeData(color: Color_me.main),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.black, //thereby
          ),
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Color_me.main),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          errorColor: Colors.red,
          checkboxTheme: const CheckboxThemeData(),
        ),
        getPages: Routes.paths,
        initialRoute: Routes.initial,
      ),
    );
  }
}
