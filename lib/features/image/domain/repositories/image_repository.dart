import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';

abstract class ImageRepository {
  Future<List<SVImage>> getSearchedImages(String searchterm);
  Future<List<SVImage>> getSuggestedImages();
}
