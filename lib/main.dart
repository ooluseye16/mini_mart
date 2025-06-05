import 'package:flashy_flushbar/flashy_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/app_router.dart';
import 'package:mini_mart/core/theme/app_theme.dart';
import 'package:mini_mart/views/screens/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      //minTextAdapt: true,
      splitScreenMode: true,

      builder:
          (context, child) => MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            theme: AppTheme.lightTheme,
            builder: FlashyFlushbarProvider.init(),
            initialRoute: Navigation.routeName,
          ),
    );
  }
}
