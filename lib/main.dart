import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  final size = view.physicalSize; // dx: 1080 px, dy: 2214 px
  final pixelRatio = view.devicePixelRatio; // 2.75

  final width = size.shortestSide / pixelRatio; // 392.72 dp
  // Phone
  if (width < 600) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]); // Tablet
  } else {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
  }
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
