import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i2connect/data/bloc/auth/auth_cubit.dart';
import 'package:i2connect/data/bloc/dashboard/dashboard_cubit.dart';
import 'package:i2connect/data/bloc/voters_data/voters_data_cubit.dart';
import 'package:i2connect/data/injection/singleton.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:i2connect/provider/auth_provider.dart';
import 'package:i2connect/provider/splash_provider.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/theme/dark_theme.dart';
import 'package:i2connect/theme/light_theme.dart';
import 'package:i2connect/util/app_constants.dart';
import 'package:i2connect/view/screen/splash.dart';
import 'package:provider/provider.dart';

import 'package:i2connect/view/screen/auth/sign_in.dart';

import 'di_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initSingletons();
  await di.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<VotersDataCubit>(create: (context) => VotersDataCubit()),
        BlocProvider<DashboardCubit>(create: (context) => DashboardCubit())
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
        home: const SplashScreen(),
      ),
    );
  }
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
