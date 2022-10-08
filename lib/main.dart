import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/MainMenu.dart';
import 'package:pedoman_kepengurusan_jenazah/pages/SplashScreen.dart';

void main() {
  runApp(
    FutureBuilder(
      future: FutureSplash.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        return ProviderScope(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                toolbarHeight: 0,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
            ),
            home: snapshot.connectionState == ConnectionState.waiting
                ? const SplashScreen()
                : const MainMenu(),
          ),
        );
      },
    ),
  );
}
