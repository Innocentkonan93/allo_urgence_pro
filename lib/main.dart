import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/configs/app_colors.dart';
import 'app/configs/color_schemes.dart';
import 'app/configs/text_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 252, 28, 39),),
        textTheme: textTheme,
        scaffoldBackgroundColor: AppColors.white,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.red,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            backgroundColor: AppColors.red,
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 2,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style:OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: AppColors.red,
              )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            backgroundColor: AppColors.white,
          )
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: AppColors.red),
        ),
      ),
    );
  }
}
