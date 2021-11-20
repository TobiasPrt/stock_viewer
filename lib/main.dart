import 'package:flutter/material.dart';
import 'package:stock_viewer/splash.dart';
import 'package:stock_viewer/theme.dart';

void main() => runApp(const StockViewer());

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
