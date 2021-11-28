import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_viewer/detail.dart';
import 'package:stock_viewer/sv_image.dart';
import 'package:stock_viewer/theme.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final List<SVImage> images;

  const Home({Key? key, required this.images}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SVImage> images = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    images = widget.images;
  }

  Future<void> _loadImages(String value) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$value&per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001c697c64374c1414eb2212c446b888a23',
        });

    if (response.statusCode == 200) {
      Iterable p = jsonDecode(response.body)['photos'];
      setState(() {
        images = List.from(p.map((m) => SVImage.fromJson(m)));
        isLoading = false;
      });
    } else {
      print('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 296,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/background.jpg'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: 296,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withAlpha(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Search For Free Stock!',
                        style: Theme.of(context).textTheme.headline2),
                    const SizedBox(height: 16),
                    Container(
                      height: 44,
                      padding: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          color: SVTheme.kWhite.withAlpha(160),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(44))),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: 'Beach, Nature, Tokio',
                          isCollapsed: true,
                          isDense: true,
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: SVTheme.kDark,
                            fontWeight: FontWeight.w300,
                          ),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: SVTheme.kDark,
                          ),
                        ),
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: SVTheme.kDark,
                          fontWeight: FontWeight.w500,
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        onSubmitted: _loadImages,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Suggested Images',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                letterSpacing: 1.03,
                fontWeight: FontWeight.w300,
                color: SVTheme.kWhite,
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (isLoading)
            const SizedBox(
                width: 128,
                height: 1,
                child: LinearProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.black,
                )),
          if (isLoading) SizedBox(height: 8),
          Expanded(
            child: StaggeredGridView.countBuilder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            Detail(index: index, image: images[index]))),
                    child: Hero(
                      tag: 'image$index',
                      child: Image.network(
                        images[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (int index) => StaggeredTile.count(
                  1, images[index].height / images[index].width),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
          )
        ],
      ),
    );
  }
}
