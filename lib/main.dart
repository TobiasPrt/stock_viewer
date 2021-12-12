import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:stock_viewer/core/themes/sv_theme.dart';
import 'package:stock_viewer/features/image/presentation/stores/image_store.dart';
import 'package:stock_viewer/injection_container.dart' as di;
import 'package:stock_viewer/injection_container.dart';
import 'package:stock_viewer/loading_page.dart';

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
    return Provider(
      create: (_) => sl<ImageStore>(),
      child: MaterialApp(
          title: 'Stock Viewer',
          theme: SVTheme().getTheme(),
          debugShowCheckedModeBanner: false,
          home: const LoadingPage()),
    );
  }
}
