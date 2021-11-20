import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_viewer/sv_image.dart';
import 'package:stock_viewer/theme.dart';

class Detail extends StatelessWidget {
  final SVImage image;
  final int index;

  const Detail({Key? key, required this.image, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'View Photo',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            letterSpacing: 1.05,
            fontWeight: FontWeight.w400,
            color: SVTheme.kWhite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Hero(
                  tag: 'image$index',
                  child: Image.network(
                    image.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 96,
                decoration: BoxDecoration(
                  color: const Color(0xFF535353),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Photographer:',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              letterSpacing: 1.03,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFFA1A1A1),
                            ),
                          ),
                          Text(
                            image.photographer,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              letterSpacing: 1.03,
                              fontWeight: FontWeight.w400,
                              color: SVTheme.kWhite,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dimensions:',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              letterSpacing: 1.03,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFFA1A1A1),
                            ),
                          ),
                          Text(
                            '${image.width} x ${image.height}',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              letterSpacing: 1.03,
                              fontWeight: FontWeight.w400,
                              color: SVTheme.kWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              MaterialButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: double.infinity,
                color: Color(0xFFBD7D0D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () => null,
                height: 48,
                child: Text(
                  'Visit Website',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    letterSpacing: 1.03,
                    fontWeight: FontWeight.w500,
                    color: SVTheme.kWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
