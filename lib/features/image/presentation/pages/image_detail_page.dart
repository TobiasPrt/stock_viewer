import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_viewer/core/themes/sv_theme.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({required this.image, required this.index, Key? key})
      : super(key: key);

  final SVImage image;
  final int index;

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
                      const SizedBox(height: 16),
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
                color: const Color(0xFFBD7D0D),
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
