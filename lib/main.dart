import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sustainaville/firebase_options.dart';
import 'package:sustainaville/ui/screens/splash/splash.dart';
import 'package:sustainaville/utils/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Sustainaville: A Democracy Story',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.gameBackground),
          useMaterial3: true,
          fontFamily: 'VT323',
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 24, color: AppColors.gameForeground),
            bodyMedium: TextStyle(fontSize: 32, color: AppColors.gameForeground),
            bodyLarge: TextStyle(fontSize: 48, color: AppColors.gameForeground),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
