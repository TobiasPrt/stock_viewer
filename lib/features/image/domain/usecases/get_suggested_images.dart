import 'package:stock_viewer/core/usecases/usecase.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';

class GetSuggestedImages implements UseCase<List<SVImage>, NoParams> {
  GetSuggestedImages(this.imageRespository);

  final ImageRepository imageRespository;

  @override
  Future<List<SVImage>> call(NoParams params) async {
    return imageRespository.getSuggestedImages();
  }
}
