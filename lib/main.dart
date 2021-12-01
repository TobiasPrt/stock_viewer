import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stock_viewer/core/themes/sv_theme.dart';
import 'package:stock_viewer/injection_container.dart' as di;
import 'package:stock_viewer/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await di.init();
  runApp(const StockViewer());
}

class StockViewer extends StatelessWidget {
  const StockViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SVTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
