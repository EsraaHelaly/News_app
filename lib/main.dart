import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/core/services/dio_helper.dart';
import 'package:news_app/core/services/shared_prefs_helper.dart';
import 'package:news_app/views/home_view.dart';

import 'core/cubit/cubit.dart';
import 'core/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedPrfsHelper.init();
  bool isDark = SharedPrfsHelper.getData(key: 'isDark');

  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.isDark}) : super(key: key);
  final bool isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (
          BuildContext context,
        ) =>
            NewsCubit()
              ..getBusiness()
              ..getSports()
              ..getScience()
              ..changeMode(sharedData: isDark),
        child: BlocConsumer<NewsCubit, States>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.teal,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.teal,
                      statusBarBrightness: Brightness.light,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                      size: 35.0,
                    ),
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Color(0xFFE0E0E0),
                      selectedItemColor: Colors.teal,
                      elevation: 30.0),
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  
                  scaffoldBackgroundColor: HexColor('33739'),
                  primarySwatch: Colors.teal,
                  appBarTheme: AppBarTheme(
                    backgroundColor: HexColor('33739'),
                    elevation: 0.0,
                    titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('33739'),
                      statusBarBrightness: Brightness.light,
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.white,
                      size: 35.0,
                    ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: HexColor('33739'),
                      selectedItemColor: Colors.teal,
                      unselectedItemColor: Colors.grey,
                      elevation: 30.0),
                  textTheme:  const TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                
                ),
                themeMode: NewsCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: MyHomePage(),
              );
            }));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
