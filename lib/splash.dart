import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_viewer/home.dart';
import 'package:stock_viewer/sv_image.dart';
import 'package:stock_viewer/theme.dart';
import 'package:http/http.dart' as http;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    prepareApp();
  }

  Future prepareApp() async {
    List<SVImage> images = await _loadInitialImages();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Home(
          images: images,
        ),
      ),
    );
  }

  Future<List<SVImage>> _loadInitialImages() async {
    final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001c697c64374c1414eb2212c446b888a23',
        });

    if (response.statusCode == 200) {
      Iterable p = jsonDecode(response.body)['photos'];
      return List.from(p.map((m) => SVImage.fromJson(m)));
    } else {
      print('Failed to load images');
      return [];
    }
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
