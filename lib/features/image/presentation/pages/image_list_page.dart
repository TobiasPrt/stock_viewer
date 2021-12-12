import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_viewer/core/themes/sv_theme.dart';
import 'package:stock_viewer/features/image/presentation/pages/image_detail_page.dart';
import 'package:stock_viewer/features/image/presentation/stores/image_store.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({Key? key}) : super(key: key);

  @override
  State<ImageListPage> createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  late ImageStore _imageStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imageStore = Provider.of<ImageStore>(context);
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
          Observer(
              builder: (_) => _imageStore.loadingState == LoadingState.loading
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                          width: 128,
                          height: 1,
                          child: LinearProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.black,
                          )),
                    )
                  : Container()),
          Expanded(
            child: Observer(
              builder: (_) {
                if (_imageStore.images.isEmpty) {
                  return Text(_imageStore.errorMessage ?? '');
                }
                return StaggeredGridView.countBuilder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  crossAxisCount: 2,
                  itemCount: _imageStore.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute<ImageDetailPage>(
                                builder: (_) => ImageDetailPage(
                                    index: index,
                                    image: _imageStore.images[index]))),
                        child: Hero(
                          tag: 'image$index',
                          child: Image.network(
                            _imageStore.images[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                      1,
                      _imageStore.images[index].height /
                          _imageStore.images[index].width),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _loadImages(String searchTerm) {
    _imageStore.loadSearchedImages(searchTerm);
  }
}
