import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_masa_2/logic/lan/lan_cubit.dart';
import 'package:islami_masa_2/logic/lan/lan_state.dart';
import 'package:islami_masa_2/screens/layout_screen.dart';
import 'package:islami_masa_2/screens/quran_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    BlocProvider(
      create: (ctx) => LanCubit()..getTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanCubit, LanState>(
      builder: (context, state) {
        var cubit = LanCubit.get(context);
        // var storedTheme = cubit.getTheme();
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // Spanish
          ],
          locale: Locale(cubit.isEnglish == true ? 'en' : 'ar'),
          theme: ThemeData(
            primaryColor: Color(0xFFB7935F),
            hoverColor: Color(0xFFB7935F),
            focusColor: Colors.black,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: const TextTheme(
              labelMedium: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              labelSmall: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: const Color(0xFF1A233F),
            focusColor: Color(0xFFFBC926),
            hoverColor: Color(0xFFB7935F),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: const TextTheme(
              labelMedium: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              labelSmall: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          themeMode: cubit.storedTHeme == null
              ? ThemeMode.light
              : cubit.storedTHeme == true
                  ? ThemeMode.dark
                  : ThemeMode.light,

          // cubit.isDark == true ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: LayoutScreen.routeName,
          routes: {
            LayoutScreen.routeName: (context) => LayoutScreen(),
            QuranDetailsScreen.routeName: (context) => QuranDetailsScreen()
          },
        );
      },
    );
  }
}
