import 'package:stock_viewer/features/image/data/datasources/image_data_source.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl({required this.imageRemoteDataSource});

  final ImageRemoteDataSource imageRemoteDataSource;

  @override
  Future<List<SVImage>> getSearchedImages(String searchterm) async {
    return imageRemoteDataSource.getSearchedImages(searchterm);
  }

  @override
  Future<List<SVImage>> getSuggestedImages() async {
    return imageRemoteDataSource.getSuggestedImages();
  }
}
