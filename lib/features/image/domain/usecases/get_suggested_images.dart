import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';

class GetSuggestedImages {
  GetSuggestedImages(this.imageRespository);

  final ImageRespository imageRespository;

  Future<List<SVImage>> execute() async {
    return imageRespository.getSuggestedImages();
  }
}
