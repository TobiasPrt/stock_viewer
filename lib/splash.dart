import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_viewer/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future startTime() async {
    Duration d = const Duration(seconds: 2);
    return Timer(d, navigateToHome);
  }

  void navigateToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  Text(
                    'Stock',
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Viewer',
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
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
                color: Color(0xFFCCCCCC),
              )),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
