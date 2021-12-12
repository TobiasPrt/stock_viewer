import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:stock_viewer/core/themes/sv_theme.dart';
import 'package:stock_viewer/features/image/presentation/pages/image_list_page.dart';
import 'package:stock_viewer/features/image/presentation/stores/image_store.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _imageStore = Provider.of<ImageStore>(context)..loadSuggestedImages();
    when(
        (_) => _imageStore.loadingState == LoadingState.loaded,
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute<ImageListPage>(
                builder: (_) => const ImageListPage(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(child: Container()),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onBackground),
                  borderRadius: BorderRadius.circular(8)),
              height: 192,
              width: 192,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Stock', style: Theme.of(context).textTheme.headline1),
                  const SizedBox(height: 8),
                  Text('Viewer', style: Theme.of(context).textTheme.headline1),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(
              width: 128,
              height: 1,
              child: LinearProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.black,
              )),
          const SizedBox(height: 24),
          Expanded(child: Container()),
          Text('© 2021, Tobias Pörtner',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w300,
                color: SVTheme.kWhite,
              )),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
